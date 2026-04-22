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
- Started: 2026-04-22
- Verified: 2026-04-22
- Done: 2026-04-22

## Details

### Decisions from Q&A

- Agent does everything it has access to — containment is the guardrail, not self-restraint.
- Access controlled externally: machine accounts, limited permissions, container boundaries.
- User decides what agent has access to. Access enforced outside the agent.
- Waste = idle time + spinning on failures + low-value work. All three matter equally.
- On failure: stop, notify human (for now). Smarter escalation later.
- Pro plan (5x usage) is the main resource constraint. Prioritization matters.
- Agent picks high-value work first (quarry workflow already supports this).

### Incremental path (agreed)

1. Notification hooks (034) — know when it's stuck
2. Plugin permission fix (043) — container starts clean
3. Health check (059) — container restarts on failure
4. Spin detection — detect failure loops, stop, notify (new task)
5. Autonomous task execution (070) — run one task start to finish
6. Autonomous task selection (048) — pick next task from queue
7. Always-on (070) — container stays running, picks up work
8. Autonomous task generation — pitch valuable ideas (new task)

### Spin/failure detection (agreed)

- Token usage threshold per task — stop if budget exceeded
- Time limit per task
- Repeated tool call pattern detection (same error N times)
- Behavioral signals — no commits/file changes over time

### Token tracking (researched)

- Token data exists in `~/.claude/projects/<project>/<session>.jsonl` — per-turn `input_tokens`, `output_tokens`, cache tokens, sometimes `costUSD`.
- No built-in budget/limit settings in Claude Code.
- No Anthropic dashboard for OAuth/Pro usage.
- Community tool `ccusage` (npm) parses JSONL and sums usage.
- Custom solution needed: wrapper/hook reads JSONL, tracks cumulative per-task, stops agent at budget.

### Monitoring/alerting (agreed)

Notify human when:
- Token/resource limits hit
- Work ready for review (commits, completed tasks)
- Agent needs input (stuck, blocked, decision needed)
- Token spend reports (daily/per-task summaries)
- Git activity summaries (proof of progress)
- Task completion rate

All via push notification (ntfy.sh). Human checks in via SSH when notified.

### Next step

Once this roadmap is complete, reprioritize build-vs-buy (059) — evaluate whether to build claude-container or use existing solutions that satisfy these requirements.
