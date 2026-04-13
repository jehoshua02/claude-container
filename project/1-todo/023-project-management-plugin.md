# Move project management instructions to a Claude plugin (quarry)

Extract the project management workflow rules from `project/README.md` into a reusable Claude plugin called "quarry" in the `jehoshua02/claude-marketplace`.

## Details

- Plugin injects project management instructions (prioritization formula, workflow steps, rules) into Claude's context.
- Folder structure (`0-inbox/`, `1-todo/`, `2-doing/`, `3-done/`) remains project-specific — each repo sets up its own.
- Rules come from the plugin so they stay consistent across projects without duplication.

## Priority: 023

- Value: 5/10 — useful across all projects, personal organization, not just claude-container
- Momentum: 9/10 — frugal plugin proved the pattern, project rules already written and in use
- Effort: 2/10 — pattern established (SessionStart hook → ~/.claude/rules/), just extract and package
- Risk: 2/10 — same proven mechanism as frugal

## Notes

- User very happy with the workflow. "Working so good." Likes "rock breaking" analogy for decomposing large tasks.
- Plugin name: quarry.
- Context injection solved by frugal plugin (SessionStart hook → ~/.claude/rules/). Same pattern applies here.
- Naming analogy: Quarry extracts raw material (capture → break rocks → refine → prioritize). Forge shapes it (build → verify → ship). Could be one plugin or two that chain together.
