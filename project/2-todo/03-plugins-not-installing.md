# Plugins not installing on first run

plugins.sh runs on first container startup but plugins are not installed.

## Findings

- jehoshua02 marketplace directory exists but is empty — `marketplace add` succeeded, `plugin install` failed.
- No `.plugins-installed` marker file — the `&&` chain in entrypoint correctly prevented it.
- Official marketplace plugins downloaded fine (full directory tree present).
- The install failure is silent — `set -e` in plugins.sh should have caught it, but entrypoint may have swallowed the error.

## Tasks

- [ ] Run `claude plugin install output-style-caveman@jehoshua02` manually inside the container and capture the error.
- [ ] Check if the plugin name in plugins.sh matches what the marketplace actually provides (e.g. `caveman` vs `output-style-caveman`).
- [ ] Once install works, verify the marker file approach prevents re-install on next run.
