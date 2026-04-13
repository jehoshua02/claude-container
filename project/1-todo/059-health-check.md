# Add health check and logging configuration

Add a Docker health check and configure logging (driver, rotation) for the Claude service.

## Priority: 059

| Factor | Score | Reasoning |
|---|---|---|
| Value | 2/10 — Useful for always-on mode. Less important for interactive sessions that exit immediately. |
| Momentum | 2/10 — Not started, no related completed tasks. |
| Effort | 5/10 — Need to figure out what a meaningful health check looks like for a CLI tool. |
| Risk | 2/10 — Low risk, additive change. |
