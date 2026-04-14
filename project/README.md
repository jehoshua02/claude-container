# Project Management

## Prioritization

**Formula:**

```
Score = (Wv*(10-V)/9 + Wm*(10-M)/9 + We*(E-1)/9 + Wr*(R-1)/9) / (Wv + Wm + We + Wr) * S + 1
```

| Constant | Definition                                                                |
|----------|---------------------------------------------------------------------------|
| **V**    | Value (1-10). Impact, urgency, unblocking other work, validating assumptions. |
| **M**    | Momentum (1-10). Work already in progress. Finishing > starting. Tasks in an active slice (epic with completed tasks) score higher. |
| **E**    | Effort (1-10). Time and complexity to implement.                          |
| **R**    | Risk (1-10). Potential to break things, irreversibility, locking in bad decisions. |
| **Wv**   | Weight for Value. Max points Value can contribute.                        |
| **Wm**   | Weight for Momentum. Max points Momentum can contribute.                  |
| **We**   | Weight for Effort. Max points Effort can contribute.                      |
| **Wr**   | Weight for Risk. Max points Risk can contribute.                          |
| **S**    | Scale. Controls the score range (1 to S+1).                              |

**Defaults:** Wv=10, Wm=10, We=10, Wr=10, S=100.

**Range:** 1 to 101. Lower is better. Ties broken by gut.

## Folders

- `0-inbox/` — quick capture. Just enough to not forget.
- `1-todo/` — prioritized and ready to pick up
- `2-doing/` — in progress
- `3-done/` — completed

Files in `1-todo/` are named with zero-padded priority score prefix: `012-dockerignore.md`, `045-comments.md`, etc.

## Workflow

### 1. Capture

- New idea or action item → create a file in `0-inbox/`. At minimum a title and one sentence. Include whatever relevant detail is available at time of capture.
- Commit after capturing.

### 2. Refine

- Before selecting the next task, refine inbox items one by one.
- Q&A loop until Value, Effort, and Risk can each be scored with reasoning.
- Document key details and decisions from the Q&A loop in the task file.
- Suggest a priority score. User confirms.
- Move to `1-todo/` with the priority score prefix.
- Commit.

### 3. Pick up

- Check `2-doing/` first. Finish in-progress items before starting new ones.
- Refine all `0-inbox/` items before picking up new work.
- Pick from the top of `ls` in `1-todo/` (lowest score = highest priority). Break ties with gut.
- Move to `2-doing/`.

### 4. Complete

1. Prove it works, no errors. If claude can gather proof, claude does. Otherwise, ask user to gather proof. If it cannot be immediately proven, create a monitoring plan and schedule a follow-up.
2. Update task file: details, decisions, and verification — all before requesting review.
3. Request user review. User reviews everything: task file, version controlled changes, the diff.
4. Move task to `3-done/`.
5. Commit.
6. Go to step 3 (Pick up).

### Other transitions

| From        | To          | When                                                              |
|-------------|-------------|-------------------------------------------------------------------|
| 0-inbox/    | 3-done/     | No longer relevant. Note why in the file, move to done.           |
| 1-todo/     | 3-done/     | No longer relevant. Note why in the file, move to done.           |
| 2-doing/    | 1-todo/     | Blocked, paused, or scope changed significantly.                  |

## Rules

- All work must be tied to a task file. Key details and decisions documented in the task file as they come up.
- Document new information and decisions in the task file during work, not just during refinement.
- New action items while doing a task → quick capture in `0-inbox/`, keep doing current task.
- New action items while not doing a task → refine and put in `1-todo/`.
- Only move task files using transitions defined above. No skipping stages.
- Priority scores must be confirmed with the user. Suggest scores, but do not apply without user feedback.

## Task file template

```markdown
# Title

## Abstract

One-liner description.

## Priority: XX

- Value: X/10 — ...
- Momentum: X/10 — ...
- Effort: X/10 — ...
- Risk: X/10 — ...

## Timeline

- Captured: YYYY-MM-DD
- Refined: YYYY-MM-DD
- Started: YYYY-MM-DD
- Verified: YYYY-MM-DD
- Done: YYYY-MM-DD

## Details

Key details, decisions, and new information. Grows over time.

## Verification

Proof that the task works. Commands run, output observed.
```
