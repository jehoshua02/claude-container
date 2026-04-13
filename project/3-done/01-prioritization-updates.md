# Prioritization updates

## Abstract

Redesign the priority formula (1-10 scale, eliminate inversion) and update README.

## Priority: 01

- Manually set to top priority — must fix scoring system before scoring everything else.

## Timeline

- Captured: 2026-04-12
- Refined: 2026-04-12
- Started: 2026-04-12
- Verified: 2026-04-12
- Done: 2026-04-12

## Details

Combined from:
- prioritization-simplification: eliminate the inversion step, make mental math easier
- epic-handling subtasks: rescale from 1-3 to 1-5 (already done in README)

Split out to inbox:
- vertical-slicing: discuss how vertical slicing applies to task prioritization
- rescore-tasks: rescore all 1-todo/ tasks (after vertical slicing)

Scope:
1. Rescale factors from 1-5 to 1-10
2. Design a new formula (eliminate inversion/offset, make mental math intuitive)
3. Display factor values as X/Y (e.g. 3/10) so scale is known at a glance
4. Update README with new formula, scale, and display format

### Decisions

- Factors scored 1-10, intuitive direction (Value 10 = high value, Effort 10 = high effort)
- Formula normalizes each factor to 0-1, applies weight, sums, converts to percentage, scales
- Weights control relative importance; defaults all equal at 10
- Scale=100 gives range 1-101
- Priority 1 = best possible score
- File prefix now 3 digits (e.g. 012-task.md)

## Verification

- README updated with new formula, constants table, defaults, range, display format, file naming convention
