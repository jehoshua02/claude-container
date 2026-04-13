# Free model fallbacks

Configure fallback to local models via Ollama (as a separate container) or free-tier providers (Google Gemini) when rate limits are hit or for low-priority tasks. Note: Claude Code's agentic features degrade with non-Claude models.

## Priority: 070

- Value: 5/10 — Cost savings, keeps working when limits are hit
- Momentum: 2/10 — Not started, no related completed tasks
- Effort: 9/10 — Ollama container setup, model config, fallback logic, testing degradation
- Risk: 5/10 — Degraded agentic performance could cause more harm than good
