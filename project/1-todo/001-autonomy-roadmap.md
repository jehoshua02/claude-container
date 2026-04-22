# Autonomy roadmap

## Abstract

Strategize the path to safe autonomous task completion. Define capabilities, guardrails, human/AI boundary, and efficient use of Claude limits.

## Priority: 001

- Value: 10/10 — the main purpose of claude-container
- Momentum: 4/10 — key decisions made in Q&A, related tasks exist but none started
- Effort: 4/10 — discussion/documentation, needs distillation into concrete requirements
- Risk: 3/10 — strategy doc itself is low risk, but bad strategy has downstream cost

## Timeline

- Captured: 2026-04-21
- Refined: 2026-04-22

## Details

### Decisions from Q&A

- Agent does everything it has access to — containment is the guardrail, not self-restraint.
- Access controlled externally: machine accounts, limited permissions, container boundaries.
- User decides what agent has access to. Access enforced outside the agent.
- Waste = idle time + spinning on failures + low-value work. All three matter equally.
- On failure: stop, notify human (for now). Smarter escalation later.
- Pro plan (5x usage) is the main resource constraint. Prioritization matters.
- Agent picks high-value work first (quarry workflow already supports this).

### Open questions

- What's the incremental path — what do we unlock first?
- How to detect spinning/failure and stop automatically?
- How to monitor token/limit usage and avoid burn?
- What monitoring/alerting is needed to trust it?
- Related tasks: autonomous-task-selection (048), autonomous-task-execution (070), autopilot-mode (070), agent-layer-discussion (051), rate-limiting (070).
