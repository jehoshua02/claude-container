# Remote access to claude-container

## Abstract

Access claude-container's web terminal remotely from phone, work browser, or other devices.

## Priority: 05

- Value: 2 — Nice to have, not blocking anything
- Momentum: 1 — Not started
- Effort: 2 — ttyd + Tailscale + Cloudflare Tunnel setup, Docker Compose changes
- Risk: 2 — Exposing a terminal publicly has real consequences if misconfigured

## Timeline

- Captured: 2026-04-11
- Refined: 2026-04-11

## Details

- Web terminal via ttyd — best option for file review and full terminal interaction.
- Two tunnels:
  - **Tailscale** — personal devices (phone, home laptop). No public exposure. Free. ~5 min setup.
  - **Cloudflare Tunnel** — work browser access (no install needed, just URL + Cloudflare Access login). Requires a domain (~$10/yr).
- Work laptop: Tailscale likely blocked by MDM/IT. Cloudflare covers that gap.
- Proactive updates deferred — pull-based (check in when available) is fine to start.
- Security priority: Tailscale has zero public attack surface. Cloudflare Access gates the public URL.

## Verification
