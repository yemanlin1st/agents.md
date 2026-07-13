#!/usr/bin/env bash
# PEFY-GG Rocky Linux recovery bootstrap
# Target: Rocky Linux 9.x
# Purpose: restore a controlled local baseline after OS/storage integrity is confirmed.
# Security: no public service exposure, no secrets, no destructive disk operations.

set -Eeuo pipefail
IFS=$'\n\t'

INSTALL_COCKPIT="${INSTALL_COCKPIT:-1}"
INSTALL_DOCKER="${INSTALL_DOCKER:-1}"
INSTALL_PORTAINER="${INSTALL_PORTAINER:-1}"
INSTALL_OLLAMA="${INSTALL_OLLAMA:-0}"
INSTALL_NODE_TOOLCHAIN="${INSTALL_NODE_TOOLCHAIN:-0}"
TARGET_USER="${TARGET_USER:-${SUDO_USER:-$USER}}"
LOG_FILE="${LOG_FILE:-/var/log/pefy-rocky-recovery-bootstrap.log}"

if [[ ${EUID} -ne 0 ]]; then
  echo "Run this script with sudo: sudo bash $0" >&2
  exit 1
fi

exec > >(tee -a "${LOG_FILE}") 2>&1

log() { printf '\n[%s] %s\n' "$(date -Is)" "$*"; }
warn() { printf '\n[%s] WARNING: %s\n' "$(date -Is)" "$*" >&2; }
fail() { printf '\n[%s] ERROR: %s\n' "$(date -Is)" "$*" >&2; exit 1; }

on_error() {
  local code=$?
  warn "Bootstrap failed at line ${BASH_LINENO[0]} with exit code ${code}. Review ${LOG_FILE}."
  exit "${code}"
}
trap on_error ERR

command_exists() { command -v "$1" >/dev/null 2>&1; }

log "Validating operating system"
[[ -r /etc/os-release ]] || fail "/etc/os-release is unavailable."
# shellcheck disable=SC1091
source /etc/os-release
[[ "${ID:-}" == "rocky" ]] || fail "This script is intended for Rocky Linux; detected ID=${ID:-unknown}."
[[ "${VERSION_ID%%.*}" == "9" ]] || fail "Rocky Linux 9.x is required; detected VERSION_ID=${VERSION_ID:-unknown}."

log "Running non-destructive baseline checks"
dnf -q check || fail "DNF dependency check failed. Repair package integrity before continuing."
systemctl --failed --no-legend || true
lsblk -f || true
findmnt || true

log "Installing baseline administration packages"
dnf -y install \
  ca-certificates \
  curl \
  git \
  jq \
  unzip \
  tar \
  policycoreutils-python-utils \
  firewalld \
  dnf-plugins-core

systemctl enable --now firewalld

if [[ "${INSTALL_COCKPIT}" == "1" ]]; then
  log "Installing and enabling Cockpit"
  dnf -y install cockpit cockpit-system cockpit-packagekit
  systemctl enable --now cockpit.socket
  systemctl is-active --quiet cockpit.socket || fail "Cockpit socket is not active."
  warn "Cockpit is installed, but this script does not open firewall port 9090. Authorize only a private/VPN source before remote access."
fi

if [[ "${INSTALL_DOCKER}" == "1" ]]; then
  log "Installing Docker Engine from Docker's CentOS-compatible repository"
  if [[ ! -f /etc/yum.repos.d/docker-ce.repo ]]; then
    dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
  fi

  dnf -y install \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin

  systemctl enable --now docker
  systemctl is-active --quiet docker || fail "Docker service is not active."

  if id "${TARGET_USER}" >/dev/null 2>&1; then
    usermod -aG docker "${TARGET_USER}"
    warn "User ${TARGET_USER} was added to the docker group. A logout/login is required. Docker-group membership grants root-equivalent control."
  else
    warn "TARGET_USER=${TARGET_USER} does not exist; docker group membership was not changed."
  fi

  log "Verifying Docker and Compose"
  docker version
  docker compose version
  docker run --rm hello-world
fi

if [[ "${INSTALL_PORTAINER}" == "1" ]]; then
  [[ "${INSTALL_DOCKER}" == "1" ]] || command_exists docker || fail "Portainer requires Docker."
  log "Installing Portainer CE with localhost-only HTTPS binding"
  docker volume create portainer_data >/dev/null

  if docker ps -a --format '{{.Names}}' | grep -Fxq portainer; then
    warn "Existing Portainer container detected; preserving it and skipping replacement."
  else
    docker run -d \
      --name portainer \
      --restart=always \
      -p 127.0.0.1:9443:9443 \
      -v /var/run/docker.sock:/var/run/docker.sock \
      -v portainer_data:/data \
      portainer/portainer-ce:sts
  fi

  docker ps --filter name=portainer
  warn "Portainer is bound to 127.0.0.1:9443. Use an SSH tunnel, VPN, or authenticated reverse proxy; do not expose it directly."
fi

if [[ "${INSTALL_OLLAMA}" == "1" ]]; then
  log "Installing Ollama using the official Linux installer"
  curl -fsSL https://ollama.com/install.sh -o /tmp/ollama-install.sh
  chmod 0755 /tmp/ollama-install.sh
  /tmp/ollama-install.sh
  rm -f /tmp/ollama-install.sh

  systemctl enable --now ollama
  systemctl is-active --quiet ollama || fail "Ollama service is not active."

  mkdir -p /etc/systemd/system/ollama.service.d
  cat >/etc/systemd/system/ollama.service.d/10-pefy-local-only.conf <<'EOF'
[Service]
Environment="OLLAMA_HOST=127.0.0.1:11434"
EOF
  systemctl daemon-reload
  systemctl restart ollama
  curl --fail --silent --show-error http://127.0.0.1:11434/api/tags | jq .
  warn "No model was pulled automatically. Select a small quantized model only after checking available RAM, storage, and CPU capacity."
fi

if [[ "${INSTALL_NODE_TOOLCHAIN}" == "1" ]]; then
  log "Attempting a Rocky-supported Node.js toolchain"
  dnf -y module reset nodejs || true

  if dnf -q module list nodejs 2>/dev/null | grep -Eq '(^|[[:space:]])22([[:space:]]|$)'; then
    dnf -y module enable nodejs:22
  elif dnf -q module list nodejs 2>/dev/null | grep -Eq '(^|[[:space:]])20([[:space:]]|$)'; then
    dnf -y module enable nodejs:20
  else
    fail "No Node.js 20/22 module was detected. Do not install an obsolete Node.js release for Context7/OpenSkills."
  fi

  dnf -y install nodejs npm
  node --version
  npm --version

  NODE_MAJOR="$(node --version | sed -E 's/^v([0-9]+).*/\1/')"
  (( NODE_MAJOR >= 20 )) || fail "Node.js 20+ is required for the shared agent skill toolchain."

  warn "Context7, OpenSkills, and OmniRoute are not auto-installed by this root script. Install them project-locally after reviewing upstream versions and permissions."
fi

log "Final service verification"
for unit in firewalld docker cockpit.socket ollama; do
  if systemctl list-unit-files "${unit}" >/dev/null 2>&1; then
    systemctl --no-pager --full status "${unit}" || true
  fi
done

log "Network listeners"
ss -lntup || true

log "Bootstrap completed"
printf '\nNext gates:\n'
printf '  1. Re-login if docker group membership changed.\n'
printf '  2. Review firewall rules and active listeners.\n'
printf '  3. Configure secrets outside Git.\n'
printf '  4. Install project-local Context7/OpenSkills/OmniRoute only after version review.\n'
printf '  5. Enable backups, monitoring, and rollback before production workloads.\n'
