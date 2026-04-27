# Tailscale Sidecar

## Abstract

Add a Tailscale sidecar container so claude-container joins the tailnet.

## Details

- Sidecar approach: separate container running `tailscaled`, claude container uses `network_mode: service:tailscale`
- Needs Tailscale auth key passed as env var
- Enables secure access to/from other machines on the tailnet
