# Task files have inconsistent structure

## Abstract

Task files across todo and done have different sections, formatting, and levels of detail. Need a standard template and a PM rule to document decisions during work.

## Priority: 03

| Factor | Score | Reasoning |
|---|---|---|
| Value | 2 | Consistency, future readability |
| Momentum | 1 | Not started |
| Effort | 1 | Template + PM rule |
| Risk | 1 | Low |

## Timeline

- Captured: 2026-04-11
- Refined: 2026-04-11
- Started: 2026-04-11
- Verified: 2026-04-11
- Done: 2026-04-11

## Details

Template structure:
- Title
- Abstract (one-liner)
- Priority (score table)
- Timeline (captured, refined, started, verified, done — filled as task progresses)
- Details (grows over time — refinement info, decisions during work)
- Verification (proof it works)

New PM rule: document new information and decisions in the task file as they come up during work.

Apply going forward only. Do not retroactively update existing task files.

Changed priority score format from markdown table to bullet points for plain text readability.

## Verification

Template added to `project/README.md`. New PM rule added: "Document new information and decisions in the task file during work, not just during refinement."

Created test task file using template — all sections rendered correctly with bullet point priority format. Deleted after verification.

User approved.
