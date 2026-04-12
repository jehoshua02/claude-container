# Remote control in container

## Abstract

Set up Claude's remote control feature inside the container instance so agent can be steered remotely when running in the container.

## Priority: 01

- Value: 5 — critical for testing and using container agent remotely
- Momentum: 3 — just completed host setup, same pattern
- Effort: 1 — trivial, same steps as host
- Risk: 1 — no risk
- Manually set to 01 — top priority per user

## Timeline

- Captured: 2026-04-12
- Refined: 2026-04-12
- Started: 2026-04-12
- Verified: 2026-04-12
- Done: 2026-04-12

## Details

Host remote control is working (done 2026-04-12). This task covers enabling the same for the container instance. Container runs via docker compose.

### What was needed

1. **ANTHROPIC_API_KEY conflicts with OAuth** — remote-control requires OAuth login, but the API key env var overrides it. Fixed in entrypoint.sh: unsets ANTHROPIC_API_KEY when first arg is `remote-control`.

2. **Auto-confirm prompt** — `claude remote-control` asks "Enable Remote Control? (y/n)" on first use. Entrypoint pipes "y" automatically.

3. **OAuth credentials** — container needs fresh OAuth tokens in `volumes/claude-data/.credentials.json`. Copied from host (`~/.claude/.credentials.json`). Tokens expire; re-copy if auth fails.

4. **run.sh API key no longer required** — changed hard error to warning for missing ANTHROPIC_API_KEY.

### How to use

```
./run.sh remote-control --name "Claude Container"
```

Then find "Claude Container" on claude.ai/code or Claude mobile app.

### Files changed

- `services/claude/entrypoint.sh` — unset API key and auto-confirm for remote-control
- `run.sh` — API key warning instead of error
- `docker-compose.yml` — default ANTHROPIC_API_KEY to empty string

## Verification

- Ran `./run.sh remote-control --name "Claude Container"` on 2026-04-12
- Remote control server connected successfully: "Connected · workspace · HEAD"
- Session visible at claude.ai/code
