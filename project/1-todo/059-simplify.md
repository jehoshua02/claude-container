# Simplify setup

Evaluate dropping `settings.default.json` if it stays empty, removing `run.sh` in favor of `docker compose run` directly.

## Priority: 059

| Factor | Score | Reasoning |
|---|---|---|
| Value | 5/10 — Less files = less to maintain and understand |
| Momentum | 2/10 — Not started |
| Effort | 5/10 — Need to evaluate dependencies — other TODOs reference settings.default.json |
| Risk | 5/10 — Removing run.sh changes the documented UX. Removing settings.default.json blocks other work that depends on it. |
