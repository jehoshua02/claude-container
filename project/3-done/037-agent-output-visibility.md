# Agent output visibility

## Abstract

Make the container agent's Claude Code output visible via docker logs / stdout so users can monitor what the agent is doing in real time.

## Priority: 037

- Value: 7/10 — Critical for monitoring autonomous agents. Without it, you're blind.
- Momentum: 3/10 — Not started, no related work in progress.
- Effort: 3/10 — Small change to entrypoint script.
- Risk: 2/10 — Low risk, worst case output is noisy or buffered.

## Timeline

- Captured: 2026-04-22
- Refined: 2026-04-23
- Started: 2026-04-23

## Details

- Currently Claude Code output goes to TTY, not captured in docker logs.
- Container logs only show entrypoint output (plugin updates, etc.).
- User wants `docker logs -f` to show what the agent is thinking/doing.
- Options: redirect stdout, --output-format stream-json, tee to log file.
- Preferred: docker logs stdout — standard container practice.

### Decision: auto-inject `--output-format stream-json` for `--print` mode

- `--output-format stream-json` requires `--print` flag (Claude CLI constraint).
- Entrypoint detects `-p`/`--print` in args and auto-adds `--output-format stream-json`.
- If user specifies `--output-format` explicitly, we respect their choice.
- Remote-control mode unchanged — separate concern, different output path.
- Produces structured JSON lines per docker logging best practices.

### Scope limitation

- Remote-control mode TUI output not addressed. Would need a different approach (e.g., `script` capture or Claude Code remote-control format options).

## Verification

### Shell logic tested locally (all pass):
- `-p "prompt"` → injects `--output-format stream-json` ✓
- `--print "prompt"` → injects `--output-format stream-json` ✓
- `-p --output-format text "prompt"` → respects explicit format ✓
- `--resume abc` (no --print) → no injection ✓
- no args → no injection ✓

### Needs user verification:
- Build container and run with `-p "prompt"`, confirm `docker logs` shows JSON output.
- Confirm stream-json output is useful for monitoring agent activity.
