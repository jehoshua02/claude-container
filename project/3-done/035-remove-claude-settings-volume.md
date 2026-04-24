# Remove unused claude-settings volume

## Abstract

The `claude-settings` volume (`./volumes/claude-settings` → `/home/claude/.config/claude`) is empty. Claude Code does not use `~/.config/claude/` in the current version. All config lives in `~/.claude/` (the `claude-data` volume).

## Priority: 035

- Value: 5/10 — Removes confusion — users see an empty folder and wonder why
- Momentum: 2/10 — Not started, no closely related completed tasks
- Effort: 2/10 — Delete a few lines
- Risk: 5/10 — Future Claude Code versions might start using this path

## Timeline

- Captured: 2026-04-12
- Refined: 2026-04-12
- Started: 2026-04-24
- Verified: 2026-04-24
- Done: 2026-04-24

## Details

Removed from:
- `docker-compose.yml` — volume mount line
- `.gitignore` — two entries (ignore + gitkeep exception)
- `run.sh` — mkdir reference
- `volumes/claude-settings/` — directory and .gitkeep

## Verification

All references removed. Directory deleted. No README references found.
