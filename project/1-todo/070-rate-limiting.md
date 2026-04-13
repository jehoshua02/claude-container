# Implement rate limiting

Add a proxy layer or wrapper script that tracks API usage and enforces daily/hourly/weekly spend or token caps. Use Anthropic Console monthly limits as a baseline, plus a local rate-limiting proxy (could share the egress proxy) for granular control. Explore fallback to cheaper or free models when limits are hit.

## Priority: 070

- Value: 5/10 — Prevents bill shock, especially for always-on or team use
- Momentum: 2/10 — Not started
- Effort: 9/10 — Needs usage tracking, storage, threshold logic, and integration with proxy
- Risk: 5/10 — Incorrect tracking could cut off legitimate usage or fail to limit
