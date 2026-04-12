# Autopilot mode

Run Claude Code on a task without requiring interactive approval for every command. Walk away, come back, task is done.

## Notes

- Container isolation replaces interactive permission prompts as the safety boundary
- Likely uses `--dangerously-skip-permissions` or scoped `--allowedTools`
- Depends on always-on (container must already be running)
- Need to define what "done" looks like — how does the user know the task completed?
- Need to define guardrails — what should Claude NOT be allowed to do even in autopilot?
