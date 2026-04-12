# Remote control

## Abstract

Set up Claude's official remote control for both host and container instances. Check in on agent from afar.

## Priority: 01

- Manually set to top priority — enables stepping away from the computer while still collaborating with agent.

## Timeline

- Captured: 2026-04-12
- Refined: 2026-04-12
- Started: 2026-04-12
- Verified: 2026-04-12
- Done: 2026-04-12

## Details

Use Claude's built-in remote control features. Covers both claude on host and claude in container.

### How to use

- From inside a session: `/remote-control`
- Server mode (multiple sessions): `claude remote-control`
- Connect from phone: open claude.ai/code and find the session (green dot = online), or use the Claude mobile app
- To enable globally: `/config` → "Enable Remote Control for all sessions" → true
- Both local and remote input work simultaneously on the same session

### Container instance

Not yet set up — container work is pending (no container exists yet).

## Verification

- Ran `/remote-control` from host session on 2026-04-12
- Successfully sent a message from phone ("message from phone!") — confirmed bidirectional control works
