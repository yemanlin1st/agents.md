# PEFY-GG Installation Agent Instructions

These instructions govern all work under `installations/`.

## Mission

Maintain a truthful, reproducible, vendor-neutral installation control plane for Dr Erick Franck Y. PATHINVO and PEFY-GG while the Rocky Linux workstation is unavailable and during its later restoration.

## Required workflow

1. Read `../PEFY_ACCOUNT_FIRST_INSTALLATIONS.md` and `account-manifest.yaml` before proposing or changing any installation.
2. Classify each capability as `VERIFIED_ACTIVE`, `AVAILABLE_IN_ACCOUNT`, `PREPARED_EXTERNAL`, `DEFERRED_TO_ROCKY`, or `BLOCKED`.
3. Never claim software is installed merely because a repository, connector, manifest, or script exists.
4. Move a capability to `VERIFIED_ACTIVE` only after recording objective evidence such as a successful authenticated call, health check, version output, service status, or smoke test.
5. Keep secrets outside Git. Use environment variables or an approved secret manager and commit only `.env.example` files containing placeholders.
6. Prefer project-local skills and configurations over uncontrolled global installation.
7. Prefer MCP, `AGENTS.md`, OpenAPI, containers, and portable configuration to vendor-specific lock-in.
8. Keep local services bound to localhost or a private network unless a documented security review approves another exposure model.
9. Require explicit human validation for destructive, financial, legal, public, security-sensitive, credential, production, or high-cost actions.
10. Preserve a rollback procedure and verification checklist for every material change.

## Rocky Linux rules

- Target Rocky Linux 9.x unless the manifest is formally revised.
- Use `sudo dnf` and systemd-native service management.
- Do not modify partitions, filesystems, bootloaders, encryption, or storage devices through the bootstrap script.
- Confirm DNF integrity, failed units, storage visibility, and USB stability before installing the application stack.
- Do not expose Docker, Portainer, Cockpit, Ollama, PostgreSQL, Redis, MinIO, or MCP services directly to the public Internet.
- Keep Ollama models small and quantized for the existing Core i5 host until hardware capacity is measured.

## Account and cloud rules

- GitHub is the configuration and audit control plane.
- Connected account capabilities must be verified before being treated as operational.
- Use preview/development environments before production.
- Apply RBAC, RLS where relevant, audit logging, quotas, cost controls, backup, retention, and exit plans.
- Do not create a cloud dependency where a lightweight, self-hostable, offline-capable path is required.

## Change evidence

Every pull request changing installation state must include:

- capability and purpose;
- old and new status;
- upstream source and version;
- license;
- security and data-access implications;
- commands or deployment method;
- validation evidence;
- rollback steps;
- unresolved risks and owner.
