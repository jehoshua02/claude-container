# Remove unused claude-settings volume

The `claude-settings` volume (`./volumes/claude-settings` → `/home/claude/.config/claude`) is empty. Claude Code does not use `~/.config/claude/` in the current version. All config lives in `~/.claude/` (the `claude-data` volume).

Remove the volume mount from docker-compose.yml, the directory from volumes/, and any references in README.md.

## Priority: 051

- Value: 5/10 — Removes confusion — users see an empty folder and wonder why
- Momentum: 2/10 — Not started, no closely related completed tasks
- Effort: 2/10 — Delete a few lines
- Risk: 5/10 — Future Claude Code versions might start using this path
