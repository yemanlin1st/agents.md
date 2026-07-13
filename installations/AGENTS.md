# PEFY-GG Hybrid Installation Agent Instructions

These instructions govern all work under `installations/`.

## Mission

Maintain a truthful, reproducible, vendor-neutral and standards-aligned installation control plane for Dr Erick Franck Y. PATHINVO and PEFY-GG while the Rocky Linux workstation is unavailable and during its later restoration.

The operating model is dynamic, hybrid and transversal. Humans, AI systems, execution agents and policy-bounded automation collaborate according to risk, evidence, reversibility, capacity and human availability.

## Mandatory context

Before proposing or changing any installation:

1. Read `../PEFY_ACCOUNT_FIRST_INSTALLATIONS.md` and `account-manifest.yaml`.
2. Identify the relevant Retro, Now and Future duties.
3. Select and record an execution mode:
   - `H1_HUMAN_LED`
   - `H2_HUMAN_LED_AI_ASSISTED`
   - `H3_AI_LED_HUMAN_SUPERVISED`
   - `H4_AGENT_EXECUTED_HUMAN_GATED`
   - `H5_POLICY_BOUNDED_AUTOMATION`
4. Apply the safest mode compatible with the required outcome.
5. Downgrade to a safer mode, stop or escalate when confidence, scope, security, compliance, cost, resources or reversibility deteriorate.

## Required workflow

1. Classify each capability as `VERIFIED_ACTIVE`, `AVAILABLE_IN_ACCOUNT`, `PREPARED_EXTERNAL`, `DEFERRED_TO_ROCKY` or `BLOCKED`.
2. Never claim software is installed merely because a repository, connector, manifest, script or account capability exists.
3. Move a capability to `VERIFIED_ACTIVE` only after recording objective evidence such as an authenticated call, health check, version output, service status, functional test, security test or recovery test.
4. Assign an accountable owner and document human, AI, agent and automation responsibilities.
5. Keep secrets outside Git. Use environment variables or an approved secret manager and commit only placeholder `.env.example` files.
6. Prefer project-local skills and configurations over uncontrolled global installation.
7. Prefer MCP, A2A, `AGENTS.md`, OpenAPI, containers and portable configuration to vendor-specific lock-in.
8. Keep local services bound to localhost or a private network unless a documented security review approves another exposure model.
9. Require explicit human validation for destructive, financial, legal, public, security-sensitive, safety-critical, credential, production or high-cost actions.
10. Preserve a rollback procedure, safe-stop condition and verification checklist for every material change.
11. Record lifecycle stage: discover, assess, approve, prepare, provision, verify, operate, optimize, recover or retire.
12. Record maturity level from `M0_UNKNOWN` through `M5_OPTIMIZED`.

## Transversal assurance

Critical capabilities must be assessed across all applicable domains:

- strategy and governance;
- architecture and interoperability;
- cybersecurity and privacy;
- DevSecOps and quality;
- data and knowledge management;
- operations and continuity;
- finance and optimization;
- legal, regulatory and standards compliance;
- user experience and accessibility;
- ESG and sustainability;
- supplier and third-party risk;
- audit and performance.

Do not approve a capability based only on successful technical installation.

## Hybrid responsibility rules

- The accountable human owner retains final accountability.
- AI may analyze, compare, draft, challenge, test and recommend.
- Agents may execute only bounded, authorized, logged and reversible operations.
- Automation may run only inside approved policies, thresholds and stop conditions.
- Security, legal, financial, safety and production exceptions must be escalated.
- When no human is immediately available, proceed only with reversible low-risk work, preserve evidence and hold high-impact transitions for validation.

## Retro / Now / Future rules

### RETRO

- inventory existing tools and accounts;
- identify duplicate, obsolete, unsupported or insecure components;
- reconstruct missing ownership, evidence, licenses and rollback;
- normalize naming, configuration and documentation;
- capture lessons as reusable patterns.

### NOW

- maintain continuity using verified account capabilities;
- use dynamic H1–H5 routing;
- keep cloud and MCP bridges minimal, governed and measurable;
- maintain truthful status, risks, costs and evidence;
- defer host-only work until Rocky Linux integrity is restored.

### FUTURE

- restore sovereign local operation;
- encode installation, policy, validation and evidence as code;
- automate monitoring, backup, recovery, compliance and reporting;
- support multi-project, multi-Business-Unit and role-based operation;
- preserve portability across providers and runtimes.

## Rocky Linux rules

- Target Rocky Linux 9.x unless the manifest is formally revised.
- Use `sudo dnf` and systemd-native service management.
- Do not modify partitions, filesystems, bootloaders, encryption or storage devices through the bootstrap script.
- Confirm DNF integrity, failed units, storage visibility and USB stability before installing the application stack.
- Do not expose Docker, Portainer, Cockpit, Ollama, PostgreSQL, Redis, MinIO or MCP services directly to the public Internet.
- Keep Ollama models small and quantized for the existing Core i5 host until hardware capacity is measured.
- Treat the recovery script as controlled automation, not autonomous authorization.

## Account and cloud rules

- GitHub is the configuration, orchestration and audit control plane.
- Connected account capabilities must be verified before being treated as operational.
- Use preview and development environments before production.
- Apply RBAC, RLS where relevant, audit logging, quotas, cost controls, backup, retention and exit plans.
- Do not create a cloud dependency where a lightweight, self-hostable or offline-capable path is required.
- Continuously reassess whether a workload belongs in the account, managed cloud or restored local platform.

## Change evidence

Every pull request changing installation state must include:

- capability, purpose and accountable owner;
- Retro, Now and Future impact;
- old and new status;
- old and new maturity level;
- selected execution mode and justification;
- upstream source, version and license;
- architecture and dependency impact;
- security, privacy and data-access implications;
- legal, standards, supplier and financial implications;
- commands or deployment method;
- validation evidence;
- monitoring and KPI impact;
- rollback, safe-stop and recovery steps;
- unresolved risks, exceptions, escalation path and owner.

## Quality gate

A critical production capability is not ready unless:

- it is at least `M3_VERIFIED`;
- all applicable transversal controls have evidence;
- secrets are externalized;
- access and exposure are reviewed;
- monitoring and backup are active;
- rollback or recovery has been tested;
- cost and exit plans exist;
- the accountable human owner has accepted the residual risk.