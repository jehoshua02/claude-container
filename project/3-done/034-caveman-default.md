# Set caveman output style by default

Configure caveman plugin's output style in `settings.default.json` so it's active on first run without manual setup.

The setting key is `outputStyle` with value `claude-plugin-output-style-caveman:caveman`. Claude Code saves this in `/workspace/.claude/settings.local.json` when selected manually. It should go in the default settings so it's pre-configured.

Also related: investigate whether `/workspace/.claude/` should be gitignored or otherwise managed.

## No longer relevant

Frugal plugin is installed and covers the terse output requirement. Pre-configuring caveman style adds no meaningful value on top of that.

## Priority: 034

- Value: 5/10 — Nice UX — users get the intended output style immediately
- Momentum: 8/10 — Related caveman tasks completed (readme, rename, output style name)
- Effort: 2/10 — One config entry
- Risk: 5/10 — Need to verify correct settings file placement (user-level vs project-level)
