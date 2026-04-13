# Autopilot mode

Run Claude Code on a task without requiring interactive approval for every command. Walk away, come back, task is done.

## Priority: 070

- V: 9/10 — high value; core capability that enables the "walk away" use case
- M: 2/10 — no progress started; no related completed tasks in done/
- E: 9/10 — large effort; requires skip-permissions integration, guardrail design, done-detection, depends on always-on
- R: 9/10 — high risk; security implications of unattended execution, dangerously-skip-permissions surface

## Notes

- Container isolation replaces interactive permission prompts as the safety boundary
- Likely uses `--dangerously-skip-permissions` or scoped `--allowedTools`
- Depends on always-on (container must already be running)
- Need to define what "done" looks like — how does the user know the task completed?
- Need to define guardrails — what should Claude NOT be allowed to do even in autopilot?
