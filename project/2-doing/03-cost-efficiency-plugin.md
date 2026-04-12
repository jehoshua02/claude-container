# Bake cost efficiency rules into a plugin

## Abstract

Extract cost efficiency rules from services/claude/CLAUDE.md into a reusable Claude Code plugin. Install in claude-container.

## Priority: 03

- Value: 2 — Rules already work via CLAUDE.md stopgap. Plugin makes them reusable across projects.
- Momentum: 1 — Not started
- Effort: 2 — New plugin repo, plugin.json, instructions file, marketplace update, plugins.sh update
- Risk: 1 — Additive only. CLAUDE.md fallback stays until plugin is proven.

## Timeline

- Captured: 2026-04-11
- Refined: 2026-04-11
- Started: 2026-04-11
- Verified: 2026-04-11

## Details

- Plugin named `frugal`. Repo: `jehoshua02/claude-plugin-frugal`.
- Rules cover: terse responses, model selection, subagent delegation, context management, compaction strategy.
- Added to `jehoshua02` marketplace (`claude-marketplace`).
- Added to `services/claude/plugins.sh` — installs on first container startup.
- Removed cost efficiency section from `services/claude/CLAUDE.md` — plugin is now the source of truth.

### Injection mechanism — investigation

**Plugin CLAUDE.md does NOT get injected into context.** Claude Code only loads CLAUDE.md from the filesystem hierarchy (project root, parent dirs, ~/.claude/), not from plugin cache dirs.

Options evaluated:
1. **Agent approach** — plugin can auto-activate an agent via `settings.json`. But agent replaces the entire Claude Code system prompt. Non-starter — we want additive rules.
2. **SessionStart hook** — fires at session start. Workaround, not clean.
3. **Entrypoint aggregation** — append plugin CLAUDE.md files to ~/.claude/CLAUDE.md at container startup. Works but not plugin-native.
4. **`~/.claude/rules/`** — user-level rules, automatically loaded into context every session. Additive. No system prompt replacement. **Winner.**

### Decision: Use `~/.claude/rules/`

Plugin install writes `~/.claude/rules/frugal.md`. Claude picks it up automatically. No entrypoint hacks, no agent replacement. Plugin user installs and it just works.

## Verification

