# PEFY-GG Account-First Installation Control Plane

**Status:** Temporary operating baseline while the Rocky Linux workstation is unavailable  
**Owner:** Dr Erick Franck Y. PATHINVO  
**Operating model:** Account-first now, sovereign/local restoration later  
**Security rule:** Never commit passwords, API keys, OAuth tokens, private certificates, recovery codes, or production secrets.

## 1. Objective

Maintain continuity of PEFY-GG engineering, AI, automation, documentation, DevSecOps, audit, and product work without falsely treating cloud/account tools as software installed on the Rocky Linux host.

The control plane separates every capability into four states:

1. **VERIFIED_ACTIVE** — tested in the connected account.
2. **AVAILABLE_IN_ACCOUNT** — visible as an account capability but authentication or project linkage is not yet verified.
3. **PREPARED_EXTERNAL** — documented and ready to connect through MCP, API, OAuth, or deployment.
4. **DEFERRED_TO_ROCKY** — host-level installation prepared for execution after the workstation is repaired.

## 2. Current account operating baseline

### VERIFIED_ACTIVE

- GitHub account connector for `yemanlin1st`
- Repository read/write operations through the connected GitHub app
- GitHub repository `yemanlin1st/agents.md` selected as the vendor-neutral temporary control plane

### AVAILABLE_IN_ACCOUNT — verify before production use

- Google Drive / Docs / Sheets / Slides
- Gmail
- Google Calendar
- Google Contacts
- Vercel
- Supabase
- Neon Postgres
- Airtable
- Canva
- Figma
- HeyGen
- Base44

These capabilities must remain governed by least privilege, explicit write approval, auditability, and project-specific access control.

### PREPARED_EXTERNAL

- Context7 — current, version-aware software documentation through CLI/Skills or MCP
- data.gouv.fr MCP — French public-data search and exploration
- OpenSkills — universal `SKILL.md` distribution for agents that support `AGENTS.md`
- OmniRoute — multi-provider AI routing layer

### DEFERRED_TO_ROCKY

- Cockpit
- Docker Engine and Docker Compose plugin
- Portainer CE
- Ollama
- OmniRoute local runtime
- OpenSkills local runtime
- Context7 CLI/MCP client configuration
- Activepieces Community Edition
- Beszel monitoring
- Optional PostgreSQL, MinIO, Meilisearch, Qdrant, Redis, and local RAG components

## 3. Account-first architecture

```text
ChatGPT account
  ├─ GitHub: source, configuration, issues, pull requests, audit history
  ├─ Google Drive: controlled business documents and deliverables
  ├─ Vercel: temporary web/API deployment when explicitly selected
  ├─ Supabase or Neon: temporary managed PostgreSQL when explicitly selected
  ├─ Gmail/Calendar/Contacts: communication and scheduling workflows
  ├─ Canva/Figma/HeyGen: design and media production
  └─ MCP/API layer: Context7, data.gouv.fr, and future governed services

Rocky Linux after recovery
  ├─ Cockpit + Docker + Portainer
  ├─ Ollama and lightweight local models
  ├─ OmniRoute and universal provider gateway
  ├─ OpenSkills / AGENTS.md skill mesh
  ├─ Activepieces or another self-hosted workflow engine
  ├─ Beszel observability
  └─ local-first data, secrets, evidence, and backup services
```

## 4. Mandatory governance controls

- Use separate development, test, and production environments.
- Keep production secrets in an approved secret manager or platform environment variables.
- Use human validation for destructive, financial, legal, public, security-sensitive, or production actions.
- Prefer read-only integrations by default.
- Maintain an owner, purpose, data classification, retention rule, and rollback path for every connector.
- Record source repository, version, license, installation method, verification evidence, and last review date.
- Do not expose Cockpit, Portainer, Ollama, databases, or MCP servers directly to the public Internet.
- Use localhost binding, VPN, SSH tunnelling, reverse proxy authentication, or zero-trust access.
- Preserve PEFY-GG low-cost, self-hostable, offline-capable, anti-vendor-lock-in architecture.

## 5. Priority sequence

### Phase A — continuity now

1. Use GitHub as configuration and audit control plane.
2. Use connected account tools only after verification of authentication and project scope.
3. Prepare MCP and cloud deployment manifests without storing secrets.
4. Keep all local-only services marked as deferred.

### Phase B — controlled cloud bridge

1. Deploy only the services needed for active work.
2. Prefer ephemeral or free-tier environments for non-production workloads.
3. Apply RBAC, RLS, audit logs, backups, quotas, and cost alerts.
4. Document every dependency and exit path.

### Phase C — Rocky Linux restoration

1. Repair storage/USB and baseline OS integrity.
2. Run the reviewed Rocky bootstrap script.
3. Restore Docker workloads from version-controlled manifests.
4. Reconnect Context7, data.gouv.fr, OpenSkills, OmniRoute, and local AI.
5. Validate security, performance, backups, monitoring, and rollback.

## 6. Definition of done

The temporary account-first setup is operational when:

- the manifest accurately reflects real status;
- no capability is described as installed unless verified;
- GitHub holds the reproducible configuration and recovery instructions;
- secrets remain outside the repository;
- every production action requires a defined approval and rollback path;
- the Rocky Linux rebuild can be executed from version-controlled assets.
