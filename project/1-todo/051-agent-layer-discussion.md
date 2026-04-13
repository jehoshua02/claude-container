# Discuss API vs Claude Code vs other agent layers

## Abstract

Evaluate trade-offs between direct Anthropic API integration, Claude Code, and alternative agent frameworks (Aider, OpenHands, SWE-agent, Cline, Goose). This decision shapes browser UI, always-on agent, and free model fallback work.

## Priority: 051

- Value: 9/10 — Unblocks architectural decisions for browser UI, always-on agent, and model fallbacks
- Momentum: 2/10 — Not started
- Effort: 2/10 — Discussion/research, no code
- Risk: 9/10 — High irreversibility — choosing the wrong layer means rework across multiple features

## Timeline

- Captured: 2026-04-11
- Started: 2026-04-11
- Paused: 2026-04-11 — Need real-world claude-container usage first. Pain points will inform the discussion.

## Details

### Context

This project currently wraps Claude Code CLI in a Docker container. Several downstream tasks depend on which "agent layer" we commit to:

- **05-autopilot-mode** — running Claude autonomously on tasks
- **06-always-on-agent** — persistent agent that stays running
- **06-browser-ui** — web interface for interacting with Claude
- **06-free-model-fallbacks** — using non-Anthropic models

### Options

#### Option 1: Stay with Claude Code CLI

**What it is:** Current approach. Docker container runs `claude` CLI binary.

**Pros:**
- Already working. Zero migration effort.
- Full agentic loop built-in: file I/O, shell execution, error recovery, retries, context management.
- Plugin ecosystem (stout, trail, caveman).
- Native tool permissions model (allowedTools, etc.).
- Anthropic maintains it — gets new features for free.
- Supports `--print` mode for non-interactive/scripted usage.
- Supports OAuth login (Pro/Max subscriptions) — not just API keys.

**Cons:**
- Black box — can't customize the agent loop, tool definitions, or prompt structure.
- No browser UI — CLI only. Building a web frontend means wrapping a terminal emulator or proxying stdin/stdout.
- Model lock-in — only works with Claude models. No fallback to Gemini, Mistral, local models.
- No programmatic API — can't embed in a larger system without shelling out to the binary.
- Anthropic controls the release cycle. Breaking changes possible.

#### Option 2: Direct Anthropic API (Claude Agent SDK)

**What it is:** Build a custom agent using the Anthropic API directly, or use the Claude Agent SDK.

**Pros:**
- Full control over prompts, tool definitions, conversation flow, and error handling.
- Lower per-request cost — send only what's needed.
- Embeddable in any app, web service, or pipeline.
- Can build any UI (web, mobile, Slack bot, etc.).
- Predictable behavior — no autonomous actions unless you build them.

**Cons:**
- Massive development effort. Claude Code represents thousands of hours of engineering.
- Must build: file I/O tools, shell execution, error recovery, context windowing, token management, permissions model.
- No plugin ecosystem.
- Still locked to Claude models (Anthropic API only).
- Security and safety layer is entirely on you.

#### Option 3: Alternative agent frameworks

**Aider** — Git-focused coding assistant. Supports multiple LLM providers (OpenAI, Anthropic, local). Good for code editing but narrower scope than Claude Code.

**OpenHands (formerly OpenDevin)** — Open-source autonomous agent platform. Has browser UI, Docker sandboxing, multi-model support. Closest to what we'd want for browser-ui + autopilot. Active development.

**SWE-agent** — Research-focused. Good at benchmarks but less practical for daily use.

**Cline** — VS Code extension. Rich UI but tied to VS Code.

**Goose** — Block's open-source agent. Multi-model, extensible, but early stage.

**Pros (general):**
- Multi-model support (swap between Claude, GPT, Gemini, local).
- Open source — can customize anything.
- Some (OpenHands) already have browser UI and Docker sandboxing.

**Cons (general):**
- Different quality levels. Most are less polished than Claude Code.
- Community-maintained — risk of abandonment.
- Integration effort to match current setup (plugins, settings, workflow).
- May not support Anthropic OAuth/Pro subscriptions.

### Analysis

The key question is: **what are we actually building?**

If the goal is "Claude Code but in a container" — Option 1 is correct and we're already there.

If the goal is "autonomous coding agent with a web UI and model flexibility" — Option 1 becomes a constraint. We'd need Option 2 or 3.

**Recommendation:** Stay with Claude Code (Option 1) for now. Here's why:

1. **It works today.** The container setup is functional and solving real problems.
2. **Autopilot mode is possible** with `claude -p` and scripting around it.
3. **Browser UI can wrap the CLI** — tools like ttyd or gotty expose terminals via HTTP. Not ideal but functional.
4. **Model flexibility isn't urgent** — Claude is the best coding model right now.
5. **Switching cost is high** — migrating to a different framework means rebuilding plugins, workflows, and container setup.
6. **Claude Agent SDK is maturing** — if we need to go custom later, the SDK will be more capable.

**When to revisit:** If any of these become true:
- We need real multi-model support (cost optimization, outages).
- Claude Code's black-box nature blocks a critical feature.
- OpenHands or similar reaches feature parity with better extensibility.
- We need a proper web UI (not a terminal wrapper).

## Verification

Decision documented. This is a discussion/research task — verification is the documented analysis and recommendation above. No code changes needed.
