# Add no-new-privileges security option

Add `security_opt: [no-new-privileges]` to the Claude service in docker-compose.yml. Prevents privilege escalation inside the container.

## Priority: 03

| Factor | Score | Reasoning |
|---|---|---|
| Value | 2 | Prevents setuid/setgid binaries from escalating privileges |
| Momentum | 1 | Not started |
| Effort | 1 | One line in docker-compose.yml |
| Risk | 1 | Standard hardening, Claude Code doesn't need privilege escalation |

## Verification

```
$ docker compose run --rm --entrypoint bash claude -c "cat /proc/1/status | grep NoNewPrivs"
NoNewPrivs:     1
```

Flag is set. Privilege escalation blocked.
