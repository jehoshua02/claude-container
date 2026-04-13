# Add resource limits

Add memory and CPU limits to the Claude service in docker-compose.yml to prevent runaway processes from consuming all host resources.

## Priority: 032

- Value: 5/10 — Prevents a rogue process from taking down the host; meaningful safety net but not immediately urgent
- Momentum: 9/10 — Not started, no related completed tasks in done/
- Effort: 2/10 — A few lines in docker-compose.yml; very low effort
- Risk: 5/10 — Too-tight limits could cause Claude to OOM; needs testing to find right values
