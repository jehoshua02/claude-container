# Reduce git env vars from four to two

Replaced `GIT_AUTHOR_NAME`/`GIT_AUTHOR_EMAIL`/`GIT_COMMITTER_NAME`/`GIT_COMMITTER_EMAIL` with `GIT_USER_NAME`/`GIT_USER_EMAIL`. Entrypoint runs `git config --global` which covers both author and committer.

## Completed
