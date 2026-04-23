# Research 3D printers

## Abstract

Research 3D printers. Example use case for container agent. Validates container works for real tasks.

## Priority: 043

- Value: 5/10 — quality check, not urgent
- Momentum: 2/10 — not started
- Effort: 2/10 — container agent does the work
- Risk: 2/10 — zero risk

## Timeline

- Captured: 2026-04-12
- Refined: 2026-04-12
- Started: 2026-04-22
- Verified: 2026-04-22
- Done: 2026-04-23

## Details

### Run 1 (v1)
- Agent completed research, wrote output.
- Permission issue: needed `--allowedTools "Write,Read,Bash"` for non-interactive mode.
- Output quality issues:
  - Included printers that don't meet requirements (near-zero ≠ zero purge).
  - Only covered big brands (Bambu, Prusa, Creality). Missed DIY/enthusiast space.
  - No source citations.
  - No community feedback.

### Run 2 (v2)
- Updated instructions: hard filters, required sources, broader research scope.
- Improved but still missed: color changer mechanism in comparison table, Bondtech INDX, open source toolchangers.
- Diminishing returns on instruction iteration.

### Supplemental research (direct)
- Bondtech INDX: toolchanger upgrade for Prusa CORE One, up to 8 tools, near-zero purge.
- Open source competitors: TapChanger, StealthChanger, E3D ToolChanger.
- Aggregator sites: ProductChart, All3DP, Tom's Hardware.

### Lessons for autonomous agent
- Agent defaults to heavily marketed products.
- Instructions must be very explicit about filtering and scope.
- Agent needs access to aggregator sites and community sources.
- System prompt vs instructions tradeoff — user prefers better instructions over baking behavior into system prompt.

## Verification

Results published to github.com/jehoshua02/3d-printer-research.
