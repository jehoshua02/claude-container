# Notification hooks

## Abstract

Add Claude Code notification hook that pushes to phone (via ntfy.sh) when Claude is idle or waiting for input.

## Priority: 034

- Value: 7/10 — passive alerting when Claude is waiting, prevents missed prompts
- Momentum: 5/10 — research done, options identified, no setup yet
- Effort: 3/10 — hook config + ntfy.sh, minimal code
- Risk: 2/10 — async hook, can't break Claude sessions

## Timeline

- Captured: 2026-04-21
- Refined: 2026-04-21

## Details

- Solves: no visibility (#1) from remote-checkin-alternatives research.
- Claude Code `Notification` hook fires on `idle_prompt`, `permission_prompt`, etc.
- HTTP hook handler → ntfy.sh (free, no account needed, phone app available).
- Ready-made options exist: `777genius/claude-notifications-go`, `teito-dev/claudecode-pushover-integration`.
- Scope: claude-container config (hooks in settings or plugin).
