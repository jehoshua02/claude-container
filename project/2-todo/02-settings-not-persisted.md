# Settings not persisted between runs

Every run asks to pick color scheme and login. Settings should persist via the claude-data volume mount.

## Findings

- Volume mount is working: `./volumes/claude-data/` → `/home/claude/.claude` has settings.json, .credentials.json, history, plugins, sessions.
- `.credentials.json` contains valid OAuth tokens — login should not be re-prompted.
- `settings.json` exists but has no theme key. `/theme` should write to this file.
- No `.claude.json` file exists (alternate location in some versions).

## Tasks

- [ ] Run container interactively and check what happens at startup — is it login or terms acceptance?
- [ ] Run `/theme`, pick a theme, then check if `settings.json` was updated inside the container.
- [ ] If theme is saved inside the container but not on host, check file permissions on the bind mount.
- [ ] If login is re-prompted despite `.credentials.json` existing, check if Claude Code reads credentials from a different path.
