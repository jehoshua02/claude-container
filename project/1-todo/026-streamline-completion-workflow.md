# Streamline completion workflow

## Abstract

Remove redundant review/approval steps from the task completion workflow — commit approval is the review gate.

## Priority: 026

- Value: 8/10 — removes friction from every task completion
- Momentum: 5/10 — currently running the old workflow
- Effort: 2/10 — update project/README.md workflow section
- Risk: 2/10 — just a process change, easy to adjust again

## Timeline

- Captured: 2026-04-12
- Refined: 2026-04-12

## Details

Current workflow has a separate "request user review" step before committing. This is redundant — the commit approval prompt is already where the user reviews the work.

Changes:
- Drop the explicit "request user review" step
- Commit approval serves as the review gate (present work clearly at that point)
- Add: verify working tree is clean after commit as a built-in safety check
