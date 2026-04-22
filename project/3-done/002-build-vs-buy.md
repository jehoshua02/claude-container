# Build vs buy/free

## Abstract

Research whether claude-container should exist or if prebuilt alternatives achieve the same goals. Hunt down and compare open source and paid options.

## Priority: 002

- Value: 9/10 — existential question; if a good alternative exists, saves massive effort building the wrong thing
- Momentum: 5/10 — project goals and autonomy roadmap now defined, clear requirements to evaluate against
- Effort: 9/10 — requires real research: finding alternatives, comparing features, evaluating fit
- Risk: 5/10 — low downside to doing the research; slight risk of analysis paralysis

## Timeline

- Captured: 2026-04-12
- Refined: 2026-04-12
- Started: 2026-04-22
- Verified: 2026-04-22
- Done: 2026-04-22

## Details

- Not just a framework discussion — this is about whether claude-container deserves to exist.
- claude-container is a platform (tools, plugins, security, extensibility for containerized agent environments), not an application. Alternatives need to be evaluated against that scope.
- Compare both free/open-source and paid options.
- Additional requirement: model flexibility — delegate to free/open-source models to conserve paid limits.

### Verdict: Build

No existing solution covers the full requirements. Key gaps across all alternatives: spin detection, notifications, token budgeting + model flexibility + full extensibility combined.

Full report: `docs/build-vs-buy.md`

## Verification

Research documented in `docs/build-vs-buy.md` with comparison tables for 16 alternatives (8 open source, 8 paid) against 8 requirements.
