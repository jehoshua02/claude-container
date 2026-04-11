# Add .dockerignore

Add `.dockerignore` to `services/claude/` to exclude `.env`, `.git/`, `volumes/`, `README.md`, `Q&A.md`, `TODO.md`, `run.sh` from the build context.

## Priority: 02

| Factor | Score | Reasoning |
|---|---|---|
| Value | 3 | Prevents `.env` (containing API key, SSH key) from being sent to Docker build daemon. Security issue. |
| Momentum | 1 | Not started |
| Effort | 1 | Single file, five minutes |
| Risk | 1 | No downside, only upside |
