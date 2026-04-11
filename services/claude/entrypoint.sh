#!/usr/bin/env bash
set -e

# Set up SSH key if provided via Docker secret
if [ -f /run/secrets/ssh_private_key ] && [ -s /run/secrets/ssh_private_key ]; then
  mkdir -p ~/.ssh
  chmod 700 ~/.ssh
  cp /run/secrets/ssh_private_key ~/.ssh/id_rsa
  chmod 600 ~/.ssh/id_rsa

  # Add GitHub, GitLab, and Bitbucket to known_hosts to avoid interactive prompts
  ssh-keyscan -H github.com gitlab.com bitbucket.org >> ~/.ssh/known_hosts 2>/dev/null
  chmod 644 ~/.ssh/known_hosts
fi

# Set git identity from env vars (covers both author and committer)
if [ -n "$GIT_USER_NAME" ] && [ -n "$GIT_USER_EMAIL" ]; then
  git config --global user.name "$GIT_USER_NAME"
  git config --global user.email "$GIT_USER_EMAIL"
fi

# Apply default Claude settings on first run (if the config volume is empty)
if [ ! -f ~/.claude/settings.json ]; then
  mkdir -p ~/.claude
  cp ~/settings.default.json ~/.claude/settings.json
  echo "Applied default Claude settings from settings.default.json"
fi

# Install plugins on first run (marker file prevents re-running)
if [ -f ~/plugins.sh ] && [ ! -f ~/.claude/.plugins-installed ]; then
  echo "Installing plugins..."
  ~/plugins.sh && touch ~/.claude/.plugins-installed
fi

exec claude "$@"
