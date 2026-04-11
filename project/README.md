# Project Management

## Prioritization

**Formula:** `Priority = Effort + Risk - Value - Momentum + 4`

**Scale:** Each factor scored 1-3 (low, medium, high).

**Range:** 0 to 8. Lower is better (golf scoring). Ties broken by gut.

| Factor       | Description                                                               |
|--------------|---------------------------------------------------------------------------|
| **Value**    | Impact, security, unblocking other work, urgency, validating assumptions. |
| **Momentum** | Work already in progress. Finishing > starting.                           |
| **Effort**   | Time and complexity to implement.                                         |
| **Risk**     | Potential to break things, irreversibility, locking in bad decisions.     |

## Workflow

- `1-backlog/` — unrefined. Needs discussion, decisions, or open questions answered before work can begin.
- `2-todo/` — refined and ready to pick up
- `3-doing/` — in progress
- `4-done/` — completed

Files are named with zero-padded priority score prefix: `02-dockerignore.md`, `04-comments.md`, etc.

### Transitions

| From        | To          | When                                                              |
|-------------|-------------|-------------------------------------------------------------------|
| —           | 1-backlog/  | New idea or action item identified. No priority score needed.     |
| 1-backlog/  | 2-todo/     | Scope is clear, questions answered, risks addressed, scored.      |
| 1-backlog/  | dropped     | Item is no longer relevant. Delete the file.                      |
| 2-todo/     | 3-doing/    | Starting work.                                                    |
| 2-todo/     | 1-backlog/  | New questions or unknowns surfaced. Needs more refinement.        |
| 3-doing/    | 4-done/     | Work is complete and user has reviewed.                            |
| 3-doing/    | 2-todo/     | Blocked or paused. Not actively being worked on.                  |
| 3-doing/    | 1-backlog/  | Scope changed significantly. Needs re-refinement.                 |

### Rules

- When picking up work, start from the top of `ls` (lowest score = highest priority), break ties with gut.
- Check `3-doing/` first. Finish in-progress items before starting new ones.
- Do not work on items in `1-backlog/`. Refine first, then move to `2-todo/`.
- Do not work on items without a task file.
- Action items go in `1-backlog/` or `2-todo/`. Not in Q&A, README, or other docs.
- Only move task files using transitions defined in the table above. No skipping stages.
- Priority scores must be confirmed with the user. Suggest scores, but do not apply without user feedback.
- User must review work before a task moves to done.
- Move task to done before committing.
- Commit before starting another task.
