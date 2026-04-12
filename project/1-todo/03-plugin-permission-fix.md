# Plugin hook permissions on read-only filesystem

## Abstract

Replace marker-based plugin install with `claude plugin update --all` on every startup. Fixes hook permissions, auto-updates plugins, removes marker file hassle.

## Priority: 03

- Value: 2 — Fixes permissions + auto-updates + removes marker hassle
- Momentum: 1 — Not started
- Effort: 1 — Replace marker logic with update command
- Risk: 1 — Low

## Timeline

- Captured: 2026-04-12
- Refined: 2026-04-12

## Details

- Current approach: marker file (`.plugins-installed`) prevents re-running `plugins.sh`. User must manually delete marker to reinstall.
- New approach: run `plugins.sh` for initial install (if needed), then `claude plugin update --all` on every startup. Also `chmod +x` on hook scripts after.
- Solves: hook permission denied on read-only fs, stale plugins, manual marker removal.
- User-installed plugins persist in `volumes/claude-data/plugins/` across sessions.

## Verification
