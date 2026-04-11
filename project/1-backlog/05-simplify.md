# Simplify setup

Evaluate dropping `settings.default.json` if it stays empty, removing `run.sh` in favor of `docker compose run` directly.

## Priority: 05

| Factor | Score | Reasoning |
|---|---|---|
| Value | 2 | Less files = less to maintain and understand |
| Momentum | 1 | Not started |
| Effort | 2 | Need to evaluate dependencies — other TODOs reference settings.default.json |
| Risk | 2 | Removing run.sh changes the documented UX. Removing settings.default.json blocks other work that depends on it. |
