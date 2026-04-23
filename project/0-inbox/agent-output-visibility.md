# Agent output visibility

## Abstract

Make the container agent's Claude Code output visible via docker logs / stdout so users can monitor what the agent is doing in real time.

## Details

- Currently Claude Code output goes to TTY, not captured in docker logs.
- Container logs only show entrypoint output (plugin updates, etc.).
- User wants `docker logs -f` to show what the agent is thinking/doing.
- Options: redirect stdout, --output-format stream-json, tee to log file.
- Preferred: docker logs stdout — standard container practice.
