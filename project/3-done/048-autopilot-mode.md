# Autopilot mode

## Abstract

Run Claude Code on a task without requiring interactive approval. Walk away, come back, task is done.

## Priority: 048

- Value: 9/10 — Core "walk away" capability
- Momentum: 2/10 — Not started
- Effort: 9/10 — Large effort originally estimated
- Risk: 9/10 — Security implications of unattended execution

## Timeline

- Captured: 2026-04-12
- Refined: 2026-04-12
- Done: 2026-04-24

## Details

Already achieved by combination of prior work:
- Task 042: settings.default.json allows all tools (Bash, Read, Edit, Write) without prompting
- Container isolation (read-only fs, cap_drop ALL, no-new-privileges) replaces interactive permission prompts as safety boundary
- Entrypoint already handles `--print` flag for non-interactive execution

Usage: `docker compose run claude --print "do the task"`

## Verification

No new code needed. Capability exists via settings + container isolation + --print flag.
