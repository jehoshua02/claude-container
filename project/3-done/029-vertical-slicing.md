# Vertical slicing

## Abstract

Discuss how vertical slicing applies to task prioritization — getting value sooner, breaking work into independently shippable slices.

## Priority: 029

- Value: 10/10 — changes how all tasks are prioritized
- Momentum: 1/10 — not started
- Effort: 2/10 — discussion + README update
- Risk: 1/10 — easily revised

## Timeline

- Captured: 2026-04-12
- Refined: 2026-04-12
- Started: 2026-04-12
- Verified: 2026-04-12
- Done: 2026-04-12

## Details

### Definition

A vertical slice is all the tasks that lead to real-world feedback. Example: "user can login." All tasks in a vertical slice should be completed before moving to the next slice.

### How it changes prioritization

Vertical slicing is encoded through the Momentum factor. Tasks belonging to an epic with completed tasks (an active slice) score higher Momentum, naturally boosting them to the top. No new factors or rules needed — the existing formula handles it.

### Decisions

- Momentum definition updated: includes belonging to an active slice, not just personal progress on a task
- No new factors or workflow rules needed
- Vertical slice = epic that ends in real-world feedback

## Verification

- README Momentum definition updated to include active slice boost
