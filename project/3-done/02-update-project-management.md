# Update project management workflow

Simplified folder structure and workflow rules.

## Changes

- Removed `1-backlog/` and `2-todo/` distinction. Now: `0-inbox/` → `1-todo/` → `2-doing/` → `3-done/`
- Added `0-inbox/` for quick capture
- Added refine step: Q&A loop, document decisions, score, then move to todo
- Added sequential completion steps: prove → document proof → user review → move to done → commit → next task
- All work must be tied to a task file
- Dropped items go to `3-done/` with a note (not deleted) for historical context
- Mid-task new ideas go to inbox; idle new ideas get refined into todo

## Verification

`project/README.md` contains the complete updated workflow:
- Folder structure: `0-inbox/` → `1-todo/` → `2-doing/` → `3-done/`
- Sequential workflow: Capture → Refine → Pick up → Complete
- Completion steps: prove → document → user review → move to done → commit
- Rules for task files, action item capture, and transitions
- All folders created and existing tasks migrated

User approved.

## Priority: 02

| Factor | Score | Reasoning |
|---|---|---|
| Value | 3 | Process foundation for all future work |
| Momentum | 1 | Not started |
| Effort | 1 | Already done |
| Risk | 1 | Low |
