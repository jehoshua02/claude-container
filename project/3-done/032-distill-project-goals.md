# Distill goals of this project

## Abstract

Define the north star and concrete goals for claude-container. What are we building and why? What does success look like?

## Priority: 032

- Value: 9/10 — everything downstream depends on knowing what we're building; build-vs-buy can't happen without this
- Momentum: 2/10 — notes already captured (platform vs application distinction), but no related completed tasks
- Effort: 2/10 — discussion/documentation, not implementation
- Risk: 2/10 — no downside to clarifying goals

## Timeline

- Captured: 2026-04-12
- Refined: 2026-04-12
- Started: 2026-04-21
- Verified: 2026-04-21
- Done: 2026-04-21

## Details

**Thesis**: Give AI a longer leash by containing it. Control access, mitigate risk, enable autonomy.

**North star**: A secure, self-contained Docker environment where Claude agents can work autonomously on user-defined goals — with the right tools, guardrails, and infrastructure to do so reliably.

**Core pillars**:
1. **Containment** — sandboxed execution, resource limits, egress control
2. **Tooling** — git, plugins, MCP servers, browser access
3. **Autonomy infrastructure** — task queue, health checks, monitoring, always-on capability
4. **Extensibility** — user brings their own workflows, goals, and agent configurations

**Scope**: claude-container is a platform, not an application. User defines the agent's goals and workflows. claude-container provides the environment.

- build-vs-buy (priority 059) depends on this.

## Verification

Goals documented in:
- `CLAUDE.md` — "What is claude-container?" section (agent-facing)
- `README.md` — top-level thesis and core pillars (user-facing)
- This task file (details and decisions)
