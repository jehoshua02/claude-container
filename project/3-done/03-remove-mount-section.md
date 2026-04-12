# Remove "Mount a different directory" from README

Remove the customization section that encourages modifying docker-compose.yml directly. Modifications should go through pull request.

## Priority: 03

| Factor | Score | Reasoning |
|---|---|---|
| Value | 2 | Prevents users from diverging from the canonical setup |
| Momentum | 1 | Not started |
| Effort | 1 | Delete a few lines from README |
| Risk | 1 | No downside |

## Verification

Scope expanded to full README/Q&A cleanup:
- Customization section replaced with .instructions/ guidance
- Removed Node references (native installer now)
- Removed unused claude-settings from file access table
- Fixed claude.json description
- Updated git config explanation for read-only fs
- Removed suggestions to edit docker-compose.yml
- Updated security notes with hardening details
- Removed two internal Q&A items

User approved.
