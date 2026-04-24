# Clean up workspace volume

The workspace volume should only contain project folders. Currently it has:
- `.claude/` — project-level settings created by Claude Code (contains `settings.local.json` with caveman output style). Related to 04-caveman-default.
- `.gitkeep` — can be removed once a project exists

Investigate whether `.claude/` can be prevented or redirected, or if it should just be gitignored within projects.

## Priority: 051

- Value: 5/10 — Keeps workspace clean for its intended purpose
- Momentum: 2/10 — Not started, no related completed tasks
- Effort: 2/10 — Small investigation
- Risk: 5/10 — May not be preventable — Claude Code creates it automatically
