# Remote check-in alternatives

## Abstract

Research and evaluate options for checking in on Claude sessions remotely from a phone.

## Priority: 043

- Value: 6/10 — real pain point (11h hang with no visibility), useful beyond claude-container
- Momentum: 1/10 — fresh capture, no prior work
- Effort: 3/10 — research task, not implementation yet
- Risk: 2/10 — exploring options, nothing to break

## Timeline

- Captured: 2026-04-13
- Refined: 2026-04-13
- Started: 2026-04-21
- Verified: 2026-04-21
- Done: 2026-04-21

## Details

- Triggered by: bash command hung for 11h. Nothing visible in Claude app or CLI on return.
- Goal: see Claude's output and know nothing is being missed, from phone.
- Scope: claude-container and general Claude Code sessions.
- This task is research/evaluation only — implementation is a follow-on task.

### Options evaluated

**1. Claude Code Remote Control (built-in)**
- Register session with Anthropic API, interact via claude.ai/code or Claude mobile app.
- Works in Docker with outbound internet. No extra setup.
- Highest leverage — native, phone-friendly, interactive.

**2. Terminal sharing (ttyd, GoTTY, upterm)**
- Expose terminal as web page, viewable from phone browser.
- Requires port forwarding out of container.
- ttyd actively maintained. Read-only or read-write modes.

**3. Notification hooks → phone push**
- Claude Code `Notification` hook fires on `idle_prompt`, `permission_prompt`, etc.
- HTTP hook handler → ntfy.sh, Pushover, Slack, Discord.
- Ready-made: `777genius/claude-notifications-go`, `teito-dev/claudecode-pushover-integration`.
- Low effort, passive alerting.

**4. Log streaming (Grafana Loki, docker logs)**
- Full stack: Loki + Promtail + Grafana (3 containers, phone via browser).
- Simple: `docker logs` piped to ntfy.sh.
- Overkill for hang detection, useful for queryable history.

**5. Claude Code hooks for hang detection**
- `PostToolUse` hook with elapsed-time threshold → alert if tool runs too long.
- `async: true` to avoid blocking Claude.
- Backbone for custom monitoring.

### Problems identified

1. **No visibility when session drops** — Claude hangs waiting, no way to know from phone.
2. **Must opt-in at launch** — forget the `remote-control` flag, no remote access.
3. **No recovery** — if session dies or disconnects, can't restart/reconnect from phone.

### Q&A decisions

- User wants full control: steer, approve, redirect, send messages — everything available from terminal.
- Remote Control is redundant if SSH access is available — SSH gives full terminal control.
- Host is always-on (no sleep), behind NAT/firewall, SSH not yet set up.
- Tailscale (hosted) acceptable for NAT traversal — end-to-end encrypted, metadata exposure is fine.
- Headscale (self-hosted) not needed at this time.

### Alternatives considered

| Option | Type | Cost | Setup | Verdict |
|--------|------|------|-------|---------|
| **Tailscale** | Mesh VPN | Free | Low | **Winner** — lowest friction, WireGuard encrypted, phone app |
| ZeroTier | Mesh VPN | Free | Low | Viable but slightly more latency, smaller community |
| Headscale | Self-hosted mesh | VPS cost | Medium | Unnecessary — hosted Tailscale acceptable |
| Cloudflare Tunnel | Reverse tunnel | Free | Medium | Good but SSH config is non-trivial |
| ngrok | Reverse tunnel | Free (limited) | Low | Random URLs on free tier, paid for static |
| autossh + VPS | Reverse tunnel | ~$5/mo | Medium | Full control but requires VPS |
| frp / rathole | Reverse proxy | VPS cost | Medium | Self-hosted, requires VPS |
| Teleport | Access platform | Free | High | Overkill for personal use |
| Mosh | SSH enhancement | Free | N/A | Pairs with Tailscale for better roaming |

### Proposal

**Tailscale + notification hooks.** Two implementation tasks:

1. **Tailscale setup** — install on host + phone. SSH from phone to host over Tailscale. Solves: opt-in problem (#2), recovery (#3), and full interactive control.
2. **Notification hook** — Claude Code hook → ntfy.sh push notification when Claude is idle/waiting. Solves: visibility (#1), so you know when to check in.
