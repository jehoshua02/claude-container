# Add health check and logging configuration

Add a Docker health check and configure logging (driver, rotation) for the Claude service.

## Priority: 05

| Factor | Score | Reasoning |
|---|---|---|
| Value | 1 | Useful for always-on mode. Less important for interactive sessions that exit immediately. |
| Momentum | 1 | Not started |
| Effort | 2 | Need to figure out what a meaningful health check looks like for a CLI tool |
| Risk | 1 | Low risk, additive change |
