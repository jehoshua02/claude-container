# Move project management instructions to a Claude plugin (quarry)

Extract the project management workflow rules from `project/README.md` into a reusable Claude plugin called "quarry" in the `jehoshua02/claude-marketplace`.

## Abstract

Package the quarry workflow as a standalone Claude Code plugin so it can be reused across projects.

## Priority: 023

- Value: 5/10 — useful across all projects, personal organization, not just claude-container
- Momentum: 9/10 — frugal plugin proved the pattern, project rules already written and in use
- Effort: 2/10 — pattern established (SessionStart hook → ~/.claude/rules/), just extract and package
- Risk: 2/10 — same proven mechanism as frugal

## Timeline

- Captured: 2026-04-13
- Refined: 2026-04-13
- Started: 2026-04-13
- Verified: 2026-04-13
- Done: 2026-04-13

## Details

- Plugin injects project management instructions (prioritization formula, workflow steps, rules) into Claude's context.
- Folder structure (`0-inbox/`, `1-todo/`, `2-doing/`, `3-done/`) remains project-specific — each repo sets up its own.
- Rules come from the plugin so they stay consistent across projects without duplication.
- Plugin name: quarry.
- Context injection solved by frugal plugin (SessionStart hook → ~/.claude/rules/). Same pattern applies here.
- Created at: `jehoshua02/claude-plugin-quarry` (separate repo, not inside claude-marketplace).
- Naming analogy: Quarry extracts raw material (capture → break rocks → refine → prioritize). Forge shapes it (build → verify → ship). Could be one plugin or two that chain together.

## Verification

```
$ ls C:/Users/jstou/Documents/Dev/jehoshua02/claude-plugin-quarry/
.claude-plugin/plugin.json
README.md
hooks/hooks.json
hooks/setup.sh
rules/quarry.md

$ cd claude-plugin-quarry && git log --oneline
a003ab0 Initial quarry plugin
```

Plugin created and committed. Contains:
- `plugin.json` — name, version, description, author, repo, license
- `hooks/hooks.json` — SessionStart hook wiring
- `hooks/setup.sh` — copies quarry.md to ~/.claude/rules/
- `rules/quarry.md` — full workflow extracted from project/README.md
- `README.md` — usage and installation docs
