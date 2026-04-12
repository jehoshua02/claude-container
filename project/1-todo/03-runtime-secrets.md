# Switch to runtime Docker Compose secrets

Switch `ANTHROPIC_API_KEY` and `SSH_PRIVATE_KEY` from environment variables to file-based Docker Compose secrets (`/run/secrets/`). Update entrypoint to read from files. Env vars are visible via `docker inspect`.

## Priority: 03

| Factor | Score | Reasoning |
|---|---|---|
| Value | 3 | Closes a real exposure — env vars are visible in `docker inspect` and to all child processes |
| Momentum | 1 | Not started |
| Effort | 2 | Requires changes to docker-compose.yml, entrypoint.sh, and documentation |
| Risk | 1 | Well-documented Docker feature, straightforward migration |
