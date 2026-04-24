# Move ssh-keyscan to build time

## Abstract

Move the `ssh-keyscan` call from entrypoint.sh to the Dockerfile.

## Priority: 035

- Value: 2/10 — Minor startup speed improvement
- Momentum: 2/10 — Not started
- Effort: 2/10 — Move a few lines
- Risk: 2/10 — Host keys could rotate, rare

## Timeline

- Captured: 2026-04-12
- Refined: 2026-04-12
- Done: 2026-04-24

## Details

Already done. `ssh-keyscan` is in `services/claude/Dockerfile:37` and not in `entrypoint.sh`. No work needed.
