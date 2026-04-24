# Agent output visibility

## Abstract

Make the container agent's Claude Code output visible via docker logs / stdout so users can monitor what the agent is doing in real time.

## Priority: 037

- Value: 7/10 — Critical for monitoring autonomous agents. Without it, you're blind.
- Momentum: 3/10 — Not started, no related work in progress.
- Effort: 3/10 — Small change to entrypoint script.
- Risk: 2/10 — Low risk, worst case output is noisy or buffered.

## Timeline

- Captured: 2026-04-22
- Refined: 2026-04-23

## Details

- Currently Claude Code output goes to TTY, not captured in docker logs.
- Container logs only show entrypoint output (plugin updates, etc.).
- User wants `docker logs -f` to show what the agent is thinking/doing.
- Options: redirect stdout, --output-format stream-json, tee to log file.
- Preferred: docker logs stdout — standard container practice.

## Verification
