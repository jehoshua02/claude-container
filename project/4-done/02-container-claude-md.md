# Container CLAUDE.md

## Summary

Bake a CLAUDE.md into the image that Claude Code loads automatically every session. It documents the container environment and references a user-provided instructions directory for use-case specifics.

## Implementation

### Host side

- `services/claude/CLAUDE.md` — source file, checked into repo
- Dockerfile copies it into image at `/home/claude/CLAUDE.md`
- Entrypoint copies it to `/home/claude/.claude/CLAUDE.md` on startup if not already there (same pattern as `settings.default.json`)
- `./volumes/workspace/.instructions/` — user creates files here for their use case

### Container side

- `/home/claude/.claude/CLAUDE.md` — loaded automatically by Claude Code. Documents environment constraints, file rules, git setup. References `/workspace/.instructions/`. Never modified at runtime.
- `/workspace/.instructions/` — user-provided purpose, workflow, task files
- `/workspace/` — where actual work happens

### CLAUDE.md content

- Environment constraints (read-only fs, no sudo, no apt-get, no GUI)
- Available tools (git, curl, bash, ssh)
- File rules (all work in /workspace, no writing outside /workspace, no global memory)
- Git setup (identity from env vars, SSH optional)
- Ephemeral state (/tmp gone on restart)
- Reference to `/workspace/.instructions/` for use-case specific purpose, workflows, and instructions

### Changes needed

1. Create `services/claude/CLAUDE.md`
2. Add COPY line to Dockerfile
3. Add copy logic to entrypoint.sh (same pattern as settings.default.json)

## Priority: 02

| Factor | Score | Reasoning |
|---|---|---|
| Value | 3 | Claude is actively writing files the user can't see — broken experience |
| Momentum | 1 | Not started |
| Effort | 1 | One file + small entrypoint/Dockerfile change |
| Risk | 1 | Low |
