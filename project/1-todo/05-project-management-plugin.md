# Move project management instructions to a Claude plugin (quarry)

Extract the project management workflow rules from `project/README.md` into a reusable Claude plugin called "quarry" in the `jehoshua02/claude-marketplace`.

## Details

- Plugin injects project management instructions (prioritization formula, workflow steps, rules) into Claude's context.
- Folder structure (`0-inbox/`, `1-todo/`, `2-doing/`, `3-done/`) remains project-specific — each repo sets up its own.
- Rules come from the plugin so they stay consistent across projects without duplication.

## Priority: 05

| Factor | Score | Reasoning |
|---|---|---|
| Value | 2 | Reusability and consistency across projects |
| Momentum | 1 | Not started |
| Effort | 2 | New plugin repo, extract rules, test across projects |
| Risk | 2 | Plugin API constraints, need to understand how plugins inject context |

## Notes

- User very happy with the workflow. "Working so good." Likes "rock breaking" analogy for decomposing large tasks.
- Plugin name: quarry.
- Context injection solved by frugal plugin (SessionStart hook → ~/.claude/rules/). Same pattern applies here.
- Naming analogy: Quarry extracts raw material (capture → break rocks → refine → prioritize). Forge shapes it (build → verify → ship). Could be one plugin or two that chain together.
