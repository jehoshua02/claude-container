# Implement optional egress control

Add a proxy container (goproxy or custom Node proxy) under `services/proxy/`. Use Compose profiles to switch between unrestricted and proxied modes (`docker compose --profile egress up` vs `docker compose up`). Set `HTTP_PROXY`/`HTTPS_PROXY` env vars on Claude container. Proxy whitelists allowed domains (e.g. `api.anthropic.com`, `github.com`). Optional WireGuard tunnel in front of proxy.

Note: `network_mode: none` is a kill switch, not egress control — it blocks all network including the Anthropic API, so Claude won't function. Use an internal Docker network + proxy instead.

## Reference

Prior art / POC: `C:\Users\jstou\Documents\Dev\jehoshua02\egress-control-poc`

## Priority: 059

| Factor | Score | Reasoning |
|---|---|---|
| Value | 9/10 — Real security value — controls what Claude can reach on the network |
| Momentum | 2/10 — Not started |
| Effort | 9/10 — New service, new config, Compose profiles, proxy setup, domain whitelist |
| Risk | 5/10 — Proxy misconfiguration could silently break Claude or leak traffic |
