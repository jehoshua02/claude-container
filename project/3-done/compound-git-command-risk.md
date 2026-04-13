# Compound git command risk

Risk of using chained git commands (e.g. `git add && git commit && git push`) — if one step fails silently or partially, subsequent steps may operate on unexpected state.

## Not relevant

User is not interested in splitting git commands. The real concern (review/approval friction) was captured separately as streamline-completion-workflow.
