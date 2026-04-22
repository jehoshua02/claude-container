# Build vs Buy: Does claude-container need to exist?

claude-container aims to be a secure, self-contained Docker environment where AI agents work autonomously on user-defined goals. Before building further, we evaluated whether existing platforms already solve this.

## Requirements

From the [autonomy roadmap](../project/3-done/001-autonomy-roadmap.md) and [project goals](../CLAUDE.md):

1. **Containment** — sandboxed execution, resource limits, egress control
2. **Tooling** — git, plugins, MCP servers, browser access
3. **Autonomy infrastructure** — task queue, health checks, monitoring, always-on capability
4. **Extensibility** — user brings own workflows, goals, agent configs
5. **Token/usage tracking and limits**
6. **Failure detection** — spin detection, auto-stop on loops
7. **Notification/alerting** — push when agent needs input, hits limits, or has work for review
8. **Model flexibility** — delegate work to free/open-source models (hosted or self-hosted) to conserve paid limits

## Open source

| Project | Containment | Task queue | Monitoring | Extensible | Model flexible | Notes |
|---------|-------------|------------|------------|------------|----------------|-------|
| **OpenHands** | Docker/K8s sandbox | Partial | Partial (planned) | Yes (SDK, plugins) | Yes (any LLM) | Closest match. 47k stars, MIT, Series A funded. Gaps: no egress control, no spin detection, no notifications. |
| SWE-agent | Docker exec | No | No | No | Yes | Research-oriented. Single-issue fixes only. No autonomy infrastructure. |
| Goose (Block) | No sandbox | No | No | Plugins | Yes (any LLM) | Runs on host. Interactive use, not autonomous. |
| Aider | No sandbox | No | No | No | Yes (any LLM) | CLI tool. Interactive/supervised only. |
| Devon | No sandbox | No | No | No | Limited | Stalled development. |
| AutoCodeRover | No sandbox | No | No | No | Limited | Research tool. Single-shot patching. |
| TSK | Sandbox | Yes | No | No | Unknown | Small project. Task queue + sandbox concept. |
| Open SWE (LangChain) | Async agent | Yes (LangGraph) | No | Partial | Yes | Early. Interesting queue + async architecture. |

**OpenHands is the strongest open-source contender** but still has significant gaps in egress control, spin detection, and notifications. It could serve as a foundation, but would require substantial customization to meet all requirements.

## Paid / commercial

| Platform | Containment | Autonomous | Extensible | Model flexible | Price | Notes |
|----------|-------------|------------|------------|----------------|-------|-------|
| **Devin** | Own VM | Yes | No | No (own models) | $20/mo+ | Closest full-stack. Closed black box — no custom workflows, no BYO models. |
| Cursor agents | Cloud clone | Yes | No | Limited | $20/mo | Usage pool depletes fast. Not extensible. |
| GitHub Copilot | Actions sandbox | Partial | No | No | $10-39/mo | Tied to GitHub issues. No always-on, no egress control. |
| Replit Agent | Cloud IDE | Yes | No | No | $20-100/mo | Locked to Replit ecosystem. |
| Factory AI | Cloud sandbox | Yes | No | No | Enterprise only | Multi-agent, pulls from Linear/Jira. Closed, enterprise pricing. |
| **E2B** | MicroVMs | No (primitive) | Yes | Yes (BYO agent) | Free-$150/mo | Best sandbox primitive. Sub-200ms launch, up to 24h sessions. Build everything else yourself. |
| Modal | Serverless containers | No (primitive) | Yes | Yes (BYO agent) | Free-$250/mo | Pure compute. Strong cost tracking. Not agent-focused. |
| **Fly.io** | Always-on containers | No (primitive) | Yes | Yes (BYO agent) | ~$2/mo | Best for always-on. Zero agent-specific features. |

**No paid platform provides full extensibility.** Closed platforms (Devin, Cursor, Copilot, Replit, Factory) trade extensibility for polish — you can't bring your own workflows, control egress, or swap models. Infrastructure primitives (E2B, Modal, Fly.io) are viable building blocks but require assembling everything else.

## Gap analysis

| Requirement | OpenHands | Devin | E2B | Fly.io | claude-container |
|-------------|-----------|-------|-----|--------|------------------|
| Containment + egress | Partial | Partial | **Yes** | **Yes** | **Yes** |
| Git/MCP/browser tooling | **Yes** | **Yes** | Partial | No | **Yes** |
| Task queue + always-on | Partial | No | No | DIY | Planned |
| BYO workflows | **Yes** | No | **Yes** | **Yes** | **Yes** |
| Token tracking + limits | Partial | Partial | Partial | No | Planned |
| Spin/failure detection | No | No | No | No | Planned |
| Notifications | No | No | No | No | Planned |
| Model flexibility | **Yes** | No | **Yes** | **Yes** | Planned |

**No existing platform satisfies requirements 6 (spin detection) or 7 (notifications).** These are table-stakes for trusting an agent to run unsupervised.

## Verdict

**Build.** No existing solution — open source or paid — covers the full requirements. The gaps are in the areas that matter most for autonomous operation: failure detection, notifications, token budgeting, and model flexibility combined with full extensibility.

**OpenHands** is worth monitoring as potential foundation or inspiration, but adopting it wholesale would still require building the missing autonomy infrastructure on top.

**E2B and Fly.io** are viable infrastructure primitives if claude-container outgrows Docker Compose on a single host.

claude-container's value is the opinionated integration of containment + autonomy infrastructure + extensibility that doesn't exist elsewhere.

## Architectural decision: two containers, one command

We explored whether claude-container could be a single `docker run` drop-in. Conclusion: **no, for untrusted agents.**

Airtight egress control requires network-level isolation — the agent must have no network path to the internet except through a proxy. This is impossible in a single container because the agent process could open raw sockets and bypass any in-process proxy.

The minimum architecture for untrusted agents is two containers:

- **Proxy container** — mitmproxy + enforcer, bridges internal and external networks
- **Agent container** — Claude Code on an internal-only Docker network, no direct internet access

This is proven in the [egress-control-poc](https://github.com/jehoshua02/egress-control-poc). Three enforcement layers: SNI check, domain/IP allowlist, and URL path rules via TLS interception.

Deployment is still one command: `docker compose up`. Users don't need to understand the internals. Configuration via env vars and an allowlist file.

---

*Researched 2026-04-22. Evaluate again if OpenHands or another platform closes the gaps.*
