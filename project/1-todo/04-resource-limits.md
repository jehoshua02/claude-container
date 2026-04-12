# Add resource limits

Add memory and CPU limits to the Claude service in docker-compose.yml to prevent runaway processes from consuming all host resources.

## Priority: 04

| Factor | Score | Reasoning |
|---|---|---|
| Value | 2 | Prevents a rogue process from taking down the host |
| Momentum | 1 | Not started |
| Effort | 1 | A few lines in docker-compose.yml |
| Risk | 2 | Too-tight limits could cause Claude to OOM. Needs testing to find right values. |
