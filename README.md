# Claude Code Container

Give AI a longer leash by containing it. Control what it has access to, mitigate risk, enable autonomy.

A secure, self-contained Docker environment where Claude agents can work autonomously on user-defined goals — with the right tools, guardrails, and infrastructure to do so reliably.

**Core pillars:**

1. **Containment** — sandboxed execution, resource limits, egress control
2. **Tooling** — git, plugins, MCP servers, browser access
3. **Autonomy infrastructure** — task queue, health checks, monitoring, always-on capability
4. **Extensibility** — user brings their own workflows, goals, and agent configurations

## Why run Claude Code in a container?

Claude Code is an agentic coding assistant that can read files, write code, run shell commands, and interact with your system. That power is great — but it also means Claude has access to whatever your user account has access to.

Running Claude in a container gives you:

- **Isolation** — Claude operates inside a sandbox with access only to the files you explicitly mount. Your home directory, credentials, and system files stay out of reach.
- **Reproducibility** — The environment is defined in code. Anyone on your team gets the exact same setup.
- **Safety for experiments** — Let Claude freely explore, refactor, or run commands without worrying about unintended side effects on your machine.
- **Clean slate** — No conflicts with your local tools or existing Claude config.
- **CI/CD ready** — Easy to drop into automated pipelines for code review, generation, or analysis tasks.

## Requirements

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) (or Docker Engine + Compose)
- An [Anthropic API key](https://console.anthropic.com/) or a Claude Pro/Max subscription (OAuth login)

## Setup

1. **Clone or copy this folder** to your machine.

2. **Create your `.env` file:**
   ```bash
   cp .env.example .env
   ```
   Then open `.env` and set your API key (if using one):
   ```
   ANTHROPIC_API_KEY=sk-ant-...
   ```
   If you have a Claude Pro/Max subscription, you can skip the API key and log in via OAuth on first run.

3. **Put files you want Claude to work on in `./volumes/workspace/`.**
   This folder is mounted into the container at `/workspace`.

## Usage

### Interactive session

```bash
./run.sh
```

Drops you into a live Claude Code session. Claude can read and modify anything inside `/workspace`.

### One-shot prompt

```bash
./run.sh -p "Review the code in this project and suggest improvements"
```

Runs Claude with a single prompt and exits when done. Useful for scripting.

### Remote control

```bash
./run.sh remote-control --name "Claude Container"
```

Starts a remote control server so you can steer the container session from your phone or any browser via [claude.ai/code](https://claude.ai/code). Requires OAuth login (not API key) — run `claude auth login` inside the container if credentials are expired.

To refresh expired OAuth tokens, copy your host credentials into the container volume:

```bash
cp ~/.claude/.credentials.json ./volumes/claude-data/.credentials.json
```

### Pass any Claude Code flags

```bash
./run.sh --help
./run.sh -p "Add unit tests" --allowedTools "Read,Write,Bash"
```

All arguments to `run.sh` are forwarded directly to the `claude` CLI inside the container.

### Using Docker Compose directly

```bash
# Build the image
docker compose build

# Start an interactive session
docker compose run --rm claude

# One-shot with a prompt
docker compose run --rm claude -p "Summarize the project"
```

## File access

| Path on your machine | Path in container | Purpose |
|---|---|---|
| `./volumes/workspace/` | `/workspace` | Files for Claude to work with |
| `./volumes/claude-data/` | `/home/claude/.claude` | Persisted history, sessions, plugins |
| `./volumes/claude.json` | `/home/claude/.claude.json` | Claude Code internal state (OAuth, feature flags, sessions) |
| `./secrets/ssh_key` | `/run/secrets/ssh_private_key` | SSH key for private repos (optional) |

All persistent data lives under `./volumes/`. Secrets live under `./secrets/`. Both are gitignored.

## Git

Git is installed in the container and works for most operations, but requires a little configuration.

### Commits — set your identity

Git needs a name and email to create commits. Set these in your `.env` file:

```
GIT_USER_NAME=Your Name
GIT_USER_EMAIL=you@example.com
```

These are passed as environment variables and configured by the entrypoint at startup. Git config is written to `/tmp/.gitconfig` since the container filesystem is read-only.

### Private repos — SSH access

Copy your private key file into the `secrets/` directory:

```bash
cp ~/.ssh/id_rsa ./secrets/ssh_key
```

That's it. The entrypoint picks it up at startup via [Docker Compose secrets](https://docs.docker.com/compose/how-tos/use-secrets/), writes it to `~/.ssh/id_rsa` inside the container, and pre-populates `known_hosts` for GitHub, GitLab, and Bitbucket. The key is mounted read-only and never baked into the image.

The `secrets/` directory is gitignored. If no key is present, SSH is simply not configured.

### HTTPS remotes and credentials

HTTPS remotes (e.g. `https://github.com/...`) that require authentication won't have access to your host credential store. Options:

- Use SSH remotes instead (recommended).
- Pass a [personal access token](https://github.com/settings/tokens) via the URL:
  `https://<token>@github.com/org/repo.git`
- Configure Git credential storage inside the container.

### GPG signing

GPG commit signing is not supported out of the box. If you need it, you'll need to install `gpg` in the `Dockerfile` and mount your keyring — but it's usually easier to disable signing for the container workspace:

```bash
git config --local commit.gpgsign false
```

## Plugins

Plugins are installed automatically on first container startup via `services/claude/plugins.sh`. A marker file (`.plugins-installed`) in `./volumes/claude-data/` prevents re-running on subsequent starts.

### Pre-installed plugins

The following plugins from the `jehoshua02/claude-marketplace` marketplace are installed on first run:

- [**stout**](https://github.com/jehoshua02/claude-plugin-stout) — TDD red-green-refactor loop for Claude Code
- [**trail**](https://github.com/jehoshua02/claude-plugin-trail) — working log for projects, bug investigations, and ephemeral work. Organized by topic, ordered by sequence, committed to git.
- [**caveman**](https://github.com/jehoshua02/claude-plugin-caveman) — makes Claude respond in caveman speak. Short. Blunt. No filler.

### Managing plugins

Inside a running Claude session, manage plugins with:

```
claude plugin list
claude plugin install <name>@<marketplace>
claude plugin disable <name>@<marketplace>
claude plugin uninstall <name>@<marketplace>
```

Changes are persisted in `./volumes/claude-data/` and survive container restarts.

## Customization

Place instruction files in `./volumes/workspace/.instructions/` to give Claude context about your use case — purpose, workflows, task instructions, etc. Claude reads this directory at the start of every session.

## Limitations

- **Git identity must be configured** — commits will fail without `GIT_USER_NAME` and `GIT_USER_EMAIL` set in `.env`. GPG signing is not supported without extra setup.
- **SSH key is ephemeral** — The SSH key is written to disk inside the container at startup and gone when the container exits. The source file in `secrets/` stays on the host but is gitignored.
- **No GUI / browser tools** — Claude Code's browser integration (Claude in Chrome, preview tools) won't work inside the container since there's no display or browser available.
- **No host tool access** — MCP servers you have configured locally (e.g. scheduled tasks, local integrations) are not available inside the container unless you explicitly configure them in the container's Claude settings.
- **TTY required for interactive mode** — The container needs an attached terminal (`stdin_open: true`, `tty: true`). This means it won't work well with plain `docker run -d` (detached). For non-interactive use, always pass `-p "..."` with a prompt.
- **Windows path quirks** — On Docker Desktop for Windows, volume mounts go through WSL2. File writes are slower than native Linux, and file permission bits behave differently. For best performance, keep your `volumes/` inside the WSL2 filesystem (`\\wsl$\...`) rather than on a Windows drive.
- **No persistent shell state** — Each `run.sh` invocation starts a fresh container. Environment variables, installed packages, or shell history from a previous session are gone.
- **API costs** — Every session uses the Anthropic API. Long agentic runs with many tool calls can consume significant tokens. Set a budget in the Anthropic Console if needed.
- **Image size** — The image pulls Debian slim + Claude Code's native binary. Expect a few hundred MB after the first build.

## Security notes

- Your API key is passed via environment variable and never baked into the image.
- The `.gitignore` excludes `.env` and `volumes/` contents so neither is accidentally committed.
- The container runs as a non-root user with all Linux capabilities dropped (`cap_drop: ALL`).
- Privilege escalation is blocked (`no-new-privileges`).
- The root filesystem is read-only. Only mounted volumes and tmpfs (`/tmp`, `~/.ssh`) are writable.
- Network access inside the container is unrestricted by default — Claude can make outbound requests (e.g. to fetch docs or call APIs).
