# Free model fallbacks

Configure fallback to local models via Ollama (as a separate container) or free-tier providers (Google Gemini) when rate limits are hit or for low-priority tasks. Note: Claude Code's agentic features degrade with non-Claude models.

## Priority: 06

| Factor | Score | Reasoning |
|---|---|---|
| Value | 2 | Cost savings, keeps working when limits are hit |
| Momentum | 1 | Not started |
| Effort | 3 | Ollama container setup, model config, fallback logic, testing degradation |
| Risk | 2 | Degraded agentic performance could cause more harm than good |
