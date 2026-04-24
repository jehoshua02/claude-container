# Clean up workspace volume

## Abstract

Workspace volume should only contain project folders. Clean up junk and prevent `.claude/` from polluting projects.

## Priority: 038

- Value: 5/10 — Keeps workspace clean
- Momentum: 2/10 — Not started
- Effort: 2/10 — Small investigation
- Risk: 5/10 — Claude Code creates .claude/ automatically

## Timeline

- Captured: 2026-04-12
- Refined: 2026-04-12
- Started: 2026-04-24
- Verified: 2026-04-24
- Done: 2026-04-24

## Details

- `.claude/` can't be prevented — Claude Code creates it automatically. Added `.gitignore` at workspace root to exclude it.
- `.gitkeep` still needed to keep volume dir in git.
- `.instructions/` is intentional — agent task instructions. Left as-is.
- `output;C/` was empty junk directory (likely a bug). Deleted.

## Verification

- `output;C/` removed
- `.gitignore` added with `.claude/` entry
