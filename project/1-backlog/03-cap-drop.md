# Drop all Linux capabilities

Add `cap_drop: [ALL]` to the Claude service in docker-compose.yml. Claude Code doesn't need any Linux capabilities (no raw sockets, no chown, no kernel modules).

## Priority: 03

| Factor | Score | Reasoning |
|---|---|---|
| Value | 2 | Reduces attack surface if there's a container escape |
| Momentum | 1 | Not started |
| Effort | 1 | One line in docker-compose.yml |
| Risk | 1 | Standard hardening, unlikely to break anything |
