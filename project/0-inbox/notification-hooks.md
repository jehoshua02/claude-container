# Notification hooks

## Abstract

Add Claude Code notification hook that pushes to phone (via ntfy.sh) when Claude is idle or waiting for input.

## Details

- Solves: no visibility (#1) from remote-checkin-alternatives research.
- Claude Code `Notification` hook fires on `idle_prompt`, `permission_prompt`, etc.
- HTTP hook handler → ntfy.sh (free, no account needed, phone app available).
- Ready-made options exist: `777genius/claude-notifications-go`, `teito-dev/claudecode-pushover-integration`.
- Scope: claude-container config (hooks in settings or plugin).
