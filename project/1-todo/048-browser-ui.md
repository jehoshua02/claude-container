# Browser UI

Expose Claude via a web interface. Options: web terminal (ttyd or gotty) wrapping the CLI over HTTP, Open WebUI as a separate container talking to the Anthropic API, or a custom frontend with the Anthropic SDK.

## Priority: 048

- Value: 9/10 — Big UX improvement — no terminal needed, shareable with non-technical users
- Momentum: 2/10 — Not started, no related completed tasks
- Effort: 9/10 — New service, frontend work, auth considerations, port exposure
- Risk: 9/10 — Exposes Claude over HTTP — needs auth, CORS, and network security. Wrong choice of approach is hard to reverse.
