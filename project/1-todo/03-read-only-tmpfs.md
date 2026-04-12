# Harden container with read-only filesystem

Add `read_only: true` to the Claude service and `tmpfs` mounts for `/tmp` and `/home/claude/.ssh`. Prevents writes to the container filesystem outside of explicitly mounted volumes.

## Priority: 03

| Factor | Score | Reasoning |
|---|---|---|
| Value | 3 | Strong containment — only mounted volumes are writable |
| Momentum | 1 | Not started |
| Effort | 1 | A few lines in docker-compose.yml |
| Risk | 2 | Claude Code or npm may need to write to unexpected paths. Needs testing. |

## Verification

```
$ docker compose run --rm --entrypoint bash claude -c "touch /home/claude/test.txt"
touch: cannot touch '/home/claude/test.txt': Read-only file system
```

Writes outside volumes and tmpfs are denied. Claude Code runs normally (`--version` returns `2.1.101`).
