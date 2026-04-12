# Rename caveman plugin

The name `claude-plugin-output-style-caveman` is too long and verbose. Rename to `claude-plugin-caveman`.

## Changes

- Rename GitHub repo `claude-plugin-output-style-caveman` → `claude-plugin-caveman`
- Update plugin.json name
- Update marketplace entry
- Update plugins.sh and README.md in claude-container

## Priority: 05

| Factor | Score | Reasoning |
|---|---|---|
| Value | 1 | Cosmetic, works fine as-is |
| Momentum | 1 | Not started |
| Effort | 2 | Repo rename, plugin.json, marketplace, plugins.sh, README |
| Risk | 1 | No users, no backward compat concern |

## Verification

```
Installing plugins...
✔ Successfully removed marketplace: jehoshua02
Adding marketplace...
SSH not configured, cloning via HTTPS: https://github.com/jehoshua02/claude-marketplace.git
Refreshing marketplace cache (timeout: 120s)…
Cloning repository (timeout: 120s): https://github.com/jehoshua02/claude-marketplace.git
Clone complete, validating marketplace…
Cleaning up old marketplace cache…
✔ Successfully added marketplace: jehoshua02 (declared in user settings)
Installing plugin "stout@jehoshua02"...
✔ Successfully installed plugin: stout@jehoshua02 (scope: user)
Installing plugin "trail@jehoshua02"...
✔ Successfully installed plugin: trail@jehoshua02 (scope: user)
Installing plugin "caveman@jehoshua02"...
✔ Successfully installed plugin: caveman@jehoshua02 (scope: user)
```

Marketplace removed and re-added fresh. All three plugins install with the new `caveman` name. No stale cache.
