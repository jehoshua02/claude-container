# Tailscale setup

## Abstract

Install Tailscale on host (Windows 10) and phone. Enable SSH access from phone to host over Tailscale mesh VPN.

## Priority: 026

- Value: 8/10 — unlocks remote access, recovery, and full control from phone
- Momentum: 6/10 — research just completed, decision made, ready to act
- Effort: 3/10 — install on two devices, enable SSH, straightforward
- Risk: 2/10 — low risk, reversible, no impact on existing setup

## Timeline

- Captured: 2026-04-21
- Refined: 2026-04-21

## Details

- Solves: no remote access (#2), no recovery (#3) from remote-checkin-alternatives research.
- Host is always-on, behind NAT/firewall, SSH not yet set up.
- Tailscale hosted (not Headscale) — metadata exposure acceptable per user.
- Terms reviewed 2026-04-21: §5.2 confirms no traffic access, §5.3 metadata collection acceptable.
- Scope: not claude-container specific — this is host-level setup.
