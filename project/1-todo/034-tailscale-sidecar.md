# Tailscale Sidecar

## Abstract

Add a Tailscale sidecar container so claude-container joins the tailnet.

## Priority: 34

- Value: 7/10 — SSH + web UI access via tailnet for remote management
- Momentum: 1/10 — Fresh work
- Effort: 3/10 — Small compose changes, well-documented pattern
- Risk: 3/10 — Network mode change affects containers; but no port mappings on claude currently

## Timeline

- Captured: 2026-04-26
- Refined: 2026-04-26
- Started:
- Verified:
- Done:

## Details

- Sidecar approach: separate container running `tailscaled`, claude container uses `network_mode: service:tailscale`
- Needs Tailscale auth key passed as env var
- Enables SSH into container and accessing web UI via tailnet
- `cap_drop: ALL` on claude — Tailscale sidecar needs `NET_ADMIN` and `NET_RAW`
- `read_only: true` — Tailscale needs writable state dir
- `markdown-viewer` port mapping (8080:3000) may need to move to tailscale container or be accessed via tailnet

## Verification

Proof that the task works. Commands run, output observed.
