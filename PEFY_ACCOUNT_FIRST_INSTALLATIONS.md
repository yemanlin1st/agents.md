# PEFY-GG Account-First Hybrid Installation Control Plane

**Status:** Temporary operating baseline while the Rocky Linux workstation is unavailable  
**Owner:** Dr Erick Franck Y. PATHINVO  
**Operating doctrine:** Dynamic, hybrid, transversal, optimized and evidence-driven  
**Temporal model:** Retro / Now / Future  
**Target state:** Account continuity now, controlled cloud bridge when justified, sovereign/local restoration later  
**Security rule:** Never commit passwords, API keys, OAuth tokens, private certificates, recovery codes, or production secrets.

## 1. Objective

Maintain continuity of PEFY-GG engineering, AI, automation, documentation, DevSecOps, audit, compliance and business operations without falsely treating cloud/account tools as software installed on the Rocky Linux host.

The control plane is not a static installation list. It is a governed orchestration system that dynamically selects the safest and most efficient execution mode according to business criticality, human availability, data sensitivity, reversibility, confidence, cost, connectivity and infrastructure capacity.

Every capability is classified in one of five truthful states:

1. **VERIFIED_ACTIVE** — tested successfully with objective evidence.
2. **AVAILABLE_IN_ACCOUNT** — visible in the account, but authentication or project linkage is not yet verified.
3. **PREPARED_EXTERNAL** — documented and ready for MCP, API, OAuth or deployment connection.
4. **DEFERRED_TO_ROCKY** — requires host-level execution after Rocky Linux recovery.
5. **BLOCKED** — cannot proceed until a named dependency, authorization or control is resolved.

## 2. Hybrid execution doctrine

The operating mode is selected per task and may change during execution.

| Mode | Execution authority | Appropriate use | Mandatory control |
|---|---|---|---|
| **H1 — Human-led** | Human decides and executes | Legal, financial, strategic, safety-critical or ambiguous work | Evidence and peer/owner validation |
| **H2 — Human-led, AI-assisted** | Human leads; AI analyzes, drafts or checks | Most professional and operational work | Human remains accountable |
| **H3 — AI-led, human-supervised** | AI plans and executes reversible work | Structured analysis, documentation, testing and preparation | Human reviews outputs and exceptions |
| **H4 — Agent-executed, human-gated** | Agent performs bounded multi-step operations | Repeatable provisioning, configuration, CI and reporting | Approval before high-impact transition |
| **H5 — Policy-bounded automation** | Automation runs within approved rules | Monitoring, validation, backups, alerts and low-risk synchronization | Guardrails, logs, stop conditions and rollback |

### Dynamic routing factors

Before selecting or changing a mode, evaluate:

- **Impact:** operational, financial, legal, safety, security, public and reputational consequences.
- **Data sensitivity:** public, internal, confidential, restricted or regulated.
- **Reversibility:** easy rollback, partial rollback or irreversible action.
- **Confidence:** evidence quality, tool reliability and ambiguity.
- **Human availability:** expert available now, available for review, or unavailable.
- **Connectivity and resilience:** online, degraded, intermittent or offline.
- **Cost and capacity:** account quotas, cloud spend, CPU, RAM, storage and energy.
- **Time criticality:** routine, urgent or emergency.

The system must automatically downgrade to a safer mode when confidence falls, unexpected scope appears, a control fails, cost thresholds are exceeded or an action becomes less reversible.

## 3. Retro / Now / Future operating model

### RETRO — recover and normalize

- inventory previous installations, repositories, connectors and configurations;
- identify duplicates, obsolete tools, unsupported versions and security debt;
- reconstruct missing evidence, ownership, licenses and rollback instructions;
- correct naming, configuration drift and undocumented dependencies;
- capitalize lessons learned into reusable installation patterns.

### NOW — maintain operational continuity

- use verified account capabilities for current work;
- route tasks to H1–H5 according to risk and available resources;
- prepare cloud or MCP bridges only when they add measurable value;
- maintain truthful capability status and audit evidence;
- keep all host-only services deferred until Rocky Linux integrity is restored.

### FUTURE — industrialize and scale

- restore a sovereign, self-hostable and offline-capable local platform;
- standardize installations as code, policy as code and evidence as code;
- automate validation, monitoring, backup, recovery and compliance reporting;
- support multi-project, multi-Business-Unit and role-based operation;
- maintain portability across AI providers, MCP clients, operating systems and deployment targets.

## 4. Transversal assurance domains

Every installation or connector must be reviewed across the following domains, not only from a technical perspective:

1. **Strategy and governance** — purpose, owner, decision rights, RACI and alignment with PEFY-GG priorities.
2. **Architecture and interoperability** — APIs, MCP, A2A, containers, portability, integration and exit path.
3. **Cybersecurity and privacy** — least privilege, secrets, identity, segmentation, encryption, vulnerability and data protection.
4. **DevSecOps and quality** — version control, CI, testing, change approval, rollback and evidence.
5. **Data and knowledge management** — classification, provenance, retention, backup, metadata and document control.
6. **Operations and continuity** — monitoring, availability, incident response, disaster recovery and offline fallback.
7. **Finance and optimization** — licensing, total cost, quotas, egress, resource consumption and value realization.
8. **Legal, regulatory and standards compliance** — licensing, contractual constraints, ISO controls and applicable laws.
9. **User experience and accessibility** — usability, role-based interfaces, low-bandwidth operation and training.
10. **ESG and sustainability** — energy use, hardware lifecycle, responsible AI and efficient infrastructure.
11. **Supplier and third-party risk** — upstream maintenance, concentration risk, dependency health and service exit.
12. **Audit and performance** — KPIs, evidence, findings, exceptions, corrective actions and management review.

## 5. Current account operating baseline

### VERIFIED_ACTIVE

- GitHub account connector for `yemanlin1st`.
- Repository read/write operations through the connected GitHub app.
- Repository `yemanlin1st/agents.md` selected as the vendor-neutral temporary control plane.

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

These capabilities remain subject to least privilege, explicit write approval, auditability, project-specific access control and dynamic hybrid routing.

### PREPARED_EXTERNAL

- Context7 — current, version-aware software documentation through CLI/Skills or MCP.
- data.gouv.fr MCP — French public-data search and exploration.
- OpenSkills — universal `SKILL.md` distribution for agents supporting `AGENTS.md`.
- OmniRoute — multi-provider AI routing, fallback and interoperability layer.

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
- Optional PostgreSQL, MinIO, Meilisearch, Qdrant, Redis and local RAG components

## 6. Hybrid account-first architecture

```text
Human governance and validation
  ├─ Strategic owner / accountable authority
  ├─ Domain validators: Security, Legal, Finance, Quality, Data, Operations
  └─ Approval gates for high-impact actions

AI and agent orchestration
  ├─ Intake and classification
  ├─ Risk- and context-based routing H1–H5
  ├─ Tool selection and execution
  ├─ QA, evidence capture and exception handling
  └─ Escalation, rollback or safe stop

Account control plane
  ├─ GitHub: source, configuration, issues, pull requests, CI and audit history
  ├─ Google Drive: controlled documents and deliverables
  ├─ Vercel: temporary web/API deployment when justified
  ├─ Supabase or Neon: temporary managed PostgreSQL when justified
  ├─ Gmail/Calendar/Contacts: governed communication and scheduling
  ├─ Canva/Figma/HeyGen: governed design and media production
  └─ MCP/API layer: Context7, data.gouv.fr and future approved services

Rocky Linux after recovery
  ├─ Cockpit + Docker + Portainer
  ├─ Ollama and hardware-appropriate local models
  ├─ OmniRoute and universal provider gateway
  ├─ OpenSkills / AGENTS.md skill mesh
  ├─ Activepieces or another self-hosted workflow engine
  ├─ Beszel observability
  └─ local-first data, secrets, evidence, backup and recovery services
```

## 7. Dynamic orchestration lifecycle

Each capability passes through the same controlled lifecycle:

1. **Discover** — identify need, options, upstream source and alternatives.
2. **Assess** — evaluate value, risks, dependencies, standards, cost and capacity.
3. **Approve** — establish accountable owner, execution mode and control gates.
4. **Prepare** — create version-controlled manifests, placeholders, tests and rollback.
5. **Provision** — connect or install using the approved mode.
6. **Verify** — execute authentication, health, security, functional and recovery tests.
7. **Operate** — monitor service, access, cost, performance and incidents.
8. **Optimize** — remove duplication, improve routing and right-size resources.
9. **Recover** — execute tested backup, failover or rebuild procedures.
10. **Retire** — revoke access, export data, archive evidence and remove dependencies.

## 8. Mandatory governance controls

- Use separate development, test and production environments.
- Keep production secrets in an approved secret manager or platform environment variables.
- Use human validation for destructive, financial, legal, public, security-sensitive, safety-critical or production actions.
- Prefer read-only integrations and reversible actions by default.
- Maintain a role passport for each critical capability: mission, owner, human/AI/agent responsibilities, RACI, KPIs, risks, escalation and evidence.
- Record purpose, data classification, retention, source, version, license, installation method, validation evidence and rollback path.
- Do not expose Cockpit, Portainer, Ollama, databases or MCP servers directly to the public Internet.
- Use localhost binding, VPN, SSH tunnelling, authenticated reverse proxy or zero-trust access.
- Preserve PEFY-GG low-cost, self-hostable, offline-capable and anti-vendor-lock-in architecture.
- Stop or escalate automatically when policy, confidence, security, budget or resource thresholds are breached.

## 9. Maturity model

| Level | Definition | Required evidence |
|---|---|---|
| **M0 — Unknown** | Uninventoried or unowned | Discovery record |
| **M1 — Identified** | Purpose and owner recorded | Basic inventory |
| **M2 — Controlled** | Version, access, risk and rollback documented | Approved manifest |
| **M3 — Verified** | Functional, security and recovery tests passed | Objective test evidence |
| **M4 — Managed** | Monitoring, KPIs, incidents and changes controlled | Operational dashboard and logs |
| **M5 — Optimized** | Automated, portable, cost-efficient and continuously improved | Trend evidence and management review |

No critical production capability may remain below **M3**.

## 10. Performance indicators

Minimum control-plane KPIs include:

- percentage of capabilities with truthful verified status;
- percentage with named owner, data classification and rollback;
- deployment success and rollback success rates;
- mean time to detect, recover and rebuild;
- number of exposed or excessive privileges;
- patch and dependency freshness;
- backup and restore-test success;
- automation success, exception and human-escalation rates;
- cloud cost, egress and resource utilization versus budget;
- percentage of workloads portable to an alternate provider or local runtime;
- audit findings, overdue corrective actions and recurring incidents;
- value realized per capability and redundant-tool retirement rate.

## 11. Priority sequence

### Phase A — continuity now

1. Use GitHub as configuration, orchestration and audit control plane.
2. Verify connected account tools before treating them as operational.
3. Apply H1–H5 routing per task and require human gates for high impact.
4. Prepare MCP and cloud manifests without storing secrets.
5. Keep all local-only services marked as deferred.

### Phase B — controlled cloud bridge

1. Deploy only services required for active work and measurable value.
2. Prefer ephemeral or free-tier environments for non-production workloads.
3. Apply RBAC, RLS, audit logs, backup, quotas, cost alerts and exit plans.
4. Validate transversal controls and provider portability.
5. Continuously reassess whether workloads should stay in account, move to managed cloud or return local.

### Phase C — Rocky Linux restoration

1. Repair storage/USB and baseline OS integrity.
2. Run the reviewed Rocky bootstrap script.
3. Restore Docker workloads from version-controlled manifests.
4. Reconnect Context7, data.gouv.fr, OpenSkills, OmniRoute and local AI.
5. Validate security, performance, backup, recovery, monitoring and rollback.
6. Move eligible workloads from temporary cloud operation to the sovereign local target.

## 12. Definition of done

The temporary account-first system is operational when:

- the manifest accurately reflects real status, execution mode and maturity;
- no capability is described as installed unless verified;
- dynamic routing and human validation are applied according to risk;
- all transversal assurance domains have been assessed for critical capabilities;
- GitHub holds reproducible configuration, evidence requirements and recovery instructions;
- secrets remain outside the repository;
- every production action has approval, monitoring, rollback and escalation paths;
- the Rocky Linux rebuild can be executed from version-controlled assets;
- dashboards can report status, risks, costs, controls, maturity and next gates.