# Move ssh-keyscan to build time

Move the `ssh-keyscan` call from entrypoint.sh to the Dockerfile. GitHub/GitLab/Bitbucket host keys rarely change, so pre-populating `known_hosts` at build time avoids a network call on every container start.

## Priority: 051

| Factor | Score | Reasoning |
|---|---|---|
| Value | 2/10 — Minor startup speed improvement, removes a network dependency |
| Momentum | 2/10 — Not started, no related completed tasks |
| Effort | 2/10 — Move a few lines between files |
| Risk | 2/10 — Host keys could rotate, but that's rare and a rebuild fixes it |
