# Always-on agent mode

Long-running container that executes tasks without a user at the prompt. Explore cron-based scheduling (code review, dependency updates), webhook-triggered runs (GitHub events), queue-based task processing, and Claude Code's `--print`/`-p` flag for non-interactive execution. Consider watchdog/supervisor to keep the container alive and log output.

## Priority: 070

- Value: 9/10 — Unlocks autonomous workflows — CI/CD, scheduled maintenance, proactive code review
- Momentum: 2/10 — Not started; no related completed tasks
- Effort: 9/10 — Supervisor setup, task queue, scheduling, logging, error handling
- Risk: 9/10 — Autonomous agent with git access and no human in the loop. Needs guardrails.
