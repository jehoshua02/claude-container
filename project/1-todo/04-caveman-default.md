# Set caveman output style by default

Configure caveman plugin's output style in `settings.default.json` so it's active on first run without manual setup.

The setting key is `outputStyle` with value `claude-plugin-output-style-caveman:caveman`. Claude Code saves this in `/workspace/.claude/settings.local.json` when selected manually. It should go in the default settings so it's pre-configured.

Also related: investigate whether `/workspace/.claude/` should be gitignored or otherwise managed.

## Priority: 04

| Factor | Score | Reasoning |
|---|---|---|
| Value | 2 | Nice UX — users get the intended output style immediately |
| Momentum | 1 | Not started |
| Effort | 1 | One config entry |
| Risk | 2 | Need to verify correct settings file placement (user-level vs project-level) |
