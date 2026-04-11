# Always-on agent mode

Long-running container that executes tasks without a user at the prompt. Explore cron-based scheduling (code review, dependency updates), webhook-triggered runs (GitHub events), queue-based task processing, and Claude Code's `--print`/`-p` flag for non-interactive execution. Consider watchdog/supervisor to keep the container alive and log output.

## Priority: 06

| Factor | Score | Reasoning |
|---|---|---|
| Value | 3 | Unlocks autonomous workflows — CI/CD, scheduled maintenance, proactive code review |
| Momentum | 1 | Not started |
| Effort | 3 | Supervisor setup, task queue, scheduling, logging, error handling |
| Risk | 3 | Autonomous agent with git access and no human in the loop. Needs guardrails. |
