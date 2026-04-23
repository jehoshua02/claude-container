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
- Started: 2026-04-22
- Verified: 2026-04-22
- Done: 2026-04-22

## Details

- Current approach: marker file (`.plugins-installed`) prevents re-running `plugins.sh`. User must manually delete marker to reinstall.
- New approach: keep marker for initial install, then update each plugin individually on every startup. Also `chmod +x` on hook scripts after.
- `claude plugin update --all` doesn't exist — iterate with `claude plugin list` + `sed` parsing.
- Solves: hook permission denied on read-only fs, stale plugins.
- User-installed plugins persist in `volumes/claude-data/plugins/` across sessions.

## Verification

Container test output:
```
Updating plugins...
Checking for updates for plugin "caveman@jehoshua02" at user scope…
✔ caveman is already at the latest version (1.0.0).
Checking for updates for plugin "frugal@jehoshua02" at user scope…
✔ frugal is already at the latest version (1.0.0).
Checking for updates for plugin "stout@jehoshua02" at user scope…
✔ stout is already at the latest version (1.1.0).
Checking for updates for plugin "trail@jehoshua02" at user scope…
✔ trail is already at the latest version (1.31.0).
```
