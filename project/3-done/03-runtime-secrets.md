# Switch to runtime Docker Compose secrets

Switch `ANTHROPIC_API_KEY` and `SSH_PRIVATE_KEY` from environment variables to file-based Docker Compose secrets (`/run/secrets/`). Update entrypoint to read from files. Env vars are visible via `docker inspect`.

## Dropped

SSH key already uses Docker secrets. ANTHROPIC_API_KEY is the only remaining env var. Moving it to a file secret adds complexity (entrypoint reads file, exports as env var) but the key is still visible inside the container via `env` or `/proc/*/environ`. The only win is hiding it from `docker inspect` on the host. Not worth the added complexity.

## Priority: 03

| Factor | Score | Reasoning |
|---|---|---|
| Value | 3 | Closes a real exposure — env vars are visible in `docker inspect` and to all child processes |
| Momentum | 1 | Not started |
| Effort | 2 | Requires changes to docker-compose.yml, entrypoint.sh, and documentation |
| Risk | 1 | Well-documented Docker feature, straightforward migration |
