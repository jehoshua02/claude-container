# Remove unused claude-settings volume

The `claude-settings` volume (`./volumes/claude-settings` → `/home/claude/.config/claude`) is empty. Claude Code does not use `~/.config/claude/` in the current version. All config lives in `~/.claude/` (the `claude-data` volume).

Remove the volume mount from docker-compose.yml, the directory from volumes/, and any references in README.md.

## Priority: 04

| Factor | Score | Reasoning |
|---|---|---|
| Value | 2 | Removes confusion — users see an empty folder and wonder why |
| Momentum | 1 | Not started |
| Effort | 1 | Delete a few lines |
| Risk | 2 | Future Claude Code versions might start using this path |
