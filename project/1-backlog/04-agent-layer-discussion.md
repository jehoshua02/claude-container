# Discuss API vs Claude Code vs other agent layers

Evaluate trade-offs between direct Anthropic API integration, Claude Code, and alternative agent frameworks (Aider, OpenHands, SWE-agent, Cline, Goose). This decision shapes browser UI, always-on agent, and free model fallback work.

## Priority: 04

| Factor | Score | Reasoning |
|---|---|---|
| Value | 3 | Unblocks architectural decisions for browser UI, always-on agent, and model fallbacks |
| Momentum | 1 | Not started |
| Effort | 1 | Discussion/research, no code |
| Risk | 3 | High irreversibility — choosing the wrong layer means rework across multiple features |
