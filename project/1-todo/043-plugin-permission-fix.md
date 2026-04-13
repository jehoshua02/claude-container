# Plugin hook permissions on read-only filesystem

## Abstract

Replace marker-based plugin install with `claude plugin update --all` on every startup. Fixes hook permissions, auto-updates plugins, removes marker file hassle.

## Priority: 043

- Value: 5 — Fixes permissions + auto-updates + removes marker hassle (solid improvement, not critical)
- Momentum: 2 — Active slice: multiple plugin tasks already completed (plugins-not-installing, plugin-descriptions, plugin-readmes, etc.); momentum boost applied
- Effort: 2 — Small change: replace marker logic with a single update command + chmod
- Risk: 2 — Low risk, straightforward swap

## Timeline

- Captured: 2026-04-12
- Refined: 2026-04-12

## Details

- Current approach: marker file (`.plugins-installed`) prevents re-running `plugins.sh`. User must manually delete marker to reinstall.
- New approach: run `plugins.sh` for initial install (if needed), then `claude plugin update --all` on every startup. Also `chmod +x` on hook scripts after.
- Solves: hook permission denied on read-only fs, stale plugins, manual marker removal.
- User-installed plugins persist in `volumes/claude-data/plugins/` across sessions.

## Verification
