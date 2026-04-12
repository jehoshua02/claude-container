# Q&A

---

## What is the reasoning for using debian:bookworm-slim? Why not alpine?

Claude Code's native installer requires glibc, which Debian provides. Alpine uses musl libc instead, and the native binary may not work without extra dependencies (`libgcc`, `libstdc++`, `ripgrep`). Using `debian:bookworm-slim` avoids compatibility issues while staying lean (~75MB base).

---

## What's the reasoning for having a plugin script instead of RUN commands in Dockerfile?

Three reasons. First, separation of concerns — the Dockerfile defines the build environment, while `plugins.sh` defines which plugins to install, making it easy to edit one without touching the other. Second, readability — a long chain of `RUN claude plugin install ...` commands in the Dockerfile gets noisy, especially with the BuildKit secret mount syntax repeated on each line. Third, it's a single cacheable layer — Docker caches the `RUN` step as one layer, so all plugin installs either succeed together or fail together, rather than leaving a partially-installed state across multiple layers.

---

## What user should I use for git? Should I create a new user? Or use an existing user?

Two good options:

**Option A: Dedicated bot account** (e.g. `claude-bot`) — a separate GitHub account with its own SSH key. Gives you the clearest audit trail (commits are visibly from the bot, not you), and you can revoke all access by disabling the account without touching your personal setup.

**Option B: Scoped token on your personal account** — GitHub supports [fine-grained personal access tokens](https://github.com/settings/personal-access-tokens) that can be locked down to specific repos, specific permission types (e.g. contents read-write but nothing else), and an expiration date. This avoids creating a second account while still limiting blast radius. The downside is that commits look like they came from you — you can partially address this by setting `GIT_AUTHOR_NAME="Your Name (via Claude)"` in `.env` so they're distinguishable in the log.

Either way, avoid giving Claude your primary SSH key or a broad-scope token. The goal is minimum permissions with a clean revocation path.

---

## Will I own the software claude creates if it's a different user than me?

This is unsettled legal territory. Under Anthropic's [Terms of Service](https://www.anthropic.com/terms), you own the outputs Claude generates from your inputs — but copyright law generally requires human authorship, and purely AI-generated code may not be copyrightable. In practice, if you're directing Claude with specific prompts, reviewing its output, and making editorial decisions, you likely have a stronger claim to authorship than if you let it run autonomously. This is not legal advice — consult an attorney if IP ownership matters for your project.

---

## Can you explain docker-compose secrets to me? What advantage do they provide? Links to docs? Could we use it for more things? Are they available at build time, run time, or both?

Docker Compose secrets mount sensitive values as files at `/run/secrets/<name>` inside the container, rather than exposing them as environment variables. The advantage is that env vars are visible in `docker inspect`, process listings, and child processes, while secret files are only readable by the container's process and don't appear in image layers or metadata.

Secrets are available at **both** build time and run time, but configured differently. Build-time secrets use `RUN --mount=type=secret,id=NAME` in the Dockerfile. Run-time secrets are declared under `secrets:` in docker-compose.yml and appear as files in the running container.

Docs: [Docker Compose secrets](https://docs.docker.com/compose/how-tos/use-secrets/), [BuildKit secrets](https://docs.docker.com/build/building/secrets/).

---

## What's the worst thing that could happen by giving claude container git access?

Claude could force-push to a remote branch, rewrite history, or delete branches. If SSH keys or tokens with write access to production repos are available, Claude could push malicious code that gets auto-deployed. It could also read `.env` files, secrets, or credentials committed to private repos it clones inside the container. The container limits the blast radius (it can't touch your host filesystem), but anything the mounted SSH key or token has access to on the remote is fair game. Mitigation: use deploy keys scoped to specific repos with read-only access, or use short-lived tokens.

---

## How does pinning the uuid work? Any security concerns there?

The `user: "1000:1000"` directive in docker-compose.yml tells Docker to run the container process as UID 1000 / GID 1000, regardless of what user is defined in the Dockerfile. This is useful on Linux where bind-mounted files retain host ownership — if your host user is UID 1000, files Claude creates in `./workspace/` will be owned by you. Security concern: if you pin to UID 0 (root), the process runs as root inside the container, which increases the attack surface if there's a container escape vulnerability. As long as you pin to a non-root UID, it's safe and standard practice.

---

## Can MCP servers be added to the docker compose setup as additional containers? Will claude be able to communicate with them?

Yes. MCP servers that communicate over HTTP or stdio-over-network (SSE) can run as separate containers on the same Docker Compose network. Claude Code connects to them via their configured URL (e.g. `http://mcp-server:3000/sse`). The `settings.default.json` would list each MCP server's container hostname and port. For stdio-based MCP servers (the more common type), it's trickier — Claude Code expects to spawn them as a local child process. You'd either need to run those inside the Claude container, or use a stdio-to-SSE bridge so they can run as separate containers.

---

## Does anything inside the container persist between sessions?

Each `run.sh` invocation creates a fresh Docker container that exits when the session ends. This means OS-level state inside the container is thrown away between sessions — Claude is not a long-running daemon waiting for interaction. Three examples of what gets lost:

1. **Installed packages** — If Claude runs `pip install pandas` during a session, pandas is gone next session. The installed package only existed in that container's filesystem.
2. **Environment variables** — If Claude runs `export DEBUG=true`, that variable doesn't carry over to the next container.
3. **Files outside the workspace** — If Claude creates `node_modules/` or build artifacts somewhere other than `/workspace/`, they vanish when the container exits.

What **does** persist across sessions: files in `./volumes/workspace/` (mounted at `/workspace`) and Claude's config/history in `./volumes/claude-data/` (mounted at `~/.claude`). Everything else starts clean.

---

## Can I enforce daily/hourly/weekly limits on claude usage? Are there free models that we can fall back to?

Yes for limits — the [Anthropic Console](https://console.anthropic.com/) lets you set monthly spend limits on your API key. For more granular control (hourly/daily), you'd need a proxy layer that tracks usage and rejects requests over a threshold. There are no free Anthropic models, but you could configure Claude Code to use other providers as fallbacks: Claude Code supports `--model` flags, and with MCP or custom configuration, you could route to free-tier models from providers like Google (Gemini), Mistral, or local models via Ollama. The trade-off is that Claude Code's agentic features are optimized for Claude models and may degrade with others.

---

## Tell me 3-5 advantages and 3-5 disadvantages of integrating directly with claude api instead of using claude code?

**Advantages:** (1) Full control over prompts, tool definitions, and conversation flow — no opinionated abstractions. (2) Lower cost — you send only what you need, no extra tool-use overhead from the agent loop. (3) Embeddable — you can integrate it into any app, web service, or pipeline, not just a terminal. (4) Predictable behavior — no autonomous tool calls, file writes, or shell commands unless you explicitly implement them. (5) Simpler deployment — just an HTTP client, no Node.js CLI tool to install.

**Disadvantages:** (1) You lose the entire agentic loop — file reading, code writing, command execution, error recovery, and retries are all things you'd have to build yourself. (2) No built-in tool ecosystem — MCP servers, plugins, and skills don't work with raw API calls. (3) Significant development effort — Claude Code represents thousands of hours of prompt engineering and tool orchestration. (4) No interactive session management — conversation history, context windowing, and token management are on you. (5) No permissions model — Claude Code has a built-in approval system for dangerous operations; with the raw API you'd need to build your own safety layer.

