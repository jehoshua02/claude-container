# Add sensible defaults to settings.default.json

## Abstract

Configure permissions, allowed tools, and plugins in `settings.default.json` so the container works autonomously out of the box.

## Priority: 042

- Value: 5/10 — Better out-of-box experience
- Momentum: 2/10 — Not started
- Effort: 5/10 — Research settings schema
- Risk: 5/10 — Wrong defaults could restrict users

## Timeline

- Captured: 2026-04-12
- Refined: 2026-04-12
- Started: 2026-04-24
- Verified: 2026-04-24
- Done: 2026-04-24

## Details

- Permissions: allow all tools (Bash, Read, Edit, Write) — container is the sandbox.
- Plugins: pre-enable stout, trail, caveman, frugal from jehoshua02 marketplace.
- Model: no override — let API key's default apply.
- No MCP servers configured by default.
- Only applies to new containers (entrypoint skips copy if settings.json exists).

## Verification

Settings file updated. Will take effect on next fresh container build.
