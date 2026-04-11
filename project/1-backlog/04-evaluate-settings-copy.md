# Evaluate removing default settings copy from entrypoint

The entrypoint copies `settings.default.json` to `~/.claude/settings.json` on first run. If `settings.default.json` stays empty, this step is unnecessary — Claude creates its own defaults.

## Priority: 04

| Factor | Score | Reasoning |
|---|---|---|
| Value | 1 | Minor simplification, removes dead code if settings stay empty |
| Momentum | 1 | Not started |
| Effort | 1 | Delete a few lines |
| Risk | 1 | Only matters if we decide to keep settings.default.json empty |
