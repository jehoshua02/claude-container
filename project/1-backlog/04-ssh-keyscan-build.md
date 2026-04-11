# Move ssh-keyscan to build time

Move the `ssh-keyscan` call from entrypoint.sh to the Dockerfile. GitHub/GitLab/Bitbucket host keys rarely change, so pre-populating `known_hosts` at build time avoids a network call on every container start.

## Priority: 04

| Factor | Score | Reasoning |
|---|---|---|
| Value | 1 | Minor startup speed improvement, removes a network dependency |
| Momentum | 1 | Not started |
| Effort | 1 | Move a few lines between files |
| Risk | 1 | Host keys could rotate, but that's rare and a rebuild fixes it |
