## What is claude-container?

**Thesis**: Give AI a longer leash by containing it. Control access, mitigate risk, enable autonomy.

A secure, self-contained Docker environment where Claude agents can work autonomously on user-defined goals — with the right tools, guardrails, and infrastructure to do so reliably.

**Core pillars**:
1. **Containment** — sandboxed execution, resource limits, egress control
2. **Tooling** — git, plugins, MCP servers, browser access
3. **Autonomy infrastructure** — task queue, health checks, monitoring, always-on capability
4. **Extensibility** — user brings their own workflows, goals, and agent configurations

claude-container is a platform, not an application. User defines the agent's goals and workflows. claude-container provides the environment.

## Workflow

- Task management workflow comes from the quarry plugin. Folder structure is in `project/README.md`.
- Do not use Claude global memory. All project knowledge lives in this repo.
- When the next step is obvious from the workflow rules, just do it. Don't ask.
- Push to remote after every commit.
