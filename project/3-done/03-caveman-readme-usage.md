# Caveman README does not explain how to set output style

The caveman plugin README doesn't tell users how to activate the output style after installing.

## Details

- Interactive: `/config` → select output style
- Scriptable: `"outputStyle": "caveman:caveman"` in settings.json

## Priority: 03

| Factor | Score | Reasoning |
|---|---|---|
| Value | 2 | Users install but don't know how to activate |
| Momentum | 1 | Not started |
| Effort | 1 | Few lines in README |
| Risk | 1 | Low |

## Verification

README.md updated at `jehoshua02/claude-plugin-caveman` with:
- Interactive usage: `/config` → select output style
- Scriptable usage: `"outputStyle": "caveman:caveman"` in settings.json

User approved.
