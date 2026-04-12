# Autonomous task selection

## Abstract

Agent reads task queue, selects next task based on priority, and begins work. No human tells it what to do next. Depends on autonomous task execution.

## Priority: 08

- Value: 3 — meaningful step toward autonomy, but depends on autonomous-task-execution first
- Momentum: 1 — nothing started
- Effort: 2 — relatively straightforward once execution works (read 1-todo/, pick lowest score, move to 2-doing/)
- Risk: 2 — could pick wrong task, but easy to course-correct

## Timeline

- Captured: 2026-04-12
- Refined: 2026-04-12

## Details

Depends on autonomous-task-execution. Once that works, this is mostly reading the todo folder, sorting by filename prefix, and picking the top item.
