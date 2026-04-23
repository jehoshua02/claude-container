#!/usr/bin/env bash
set -e

# Restore known_hosts into tmpfs (build-time copy is wiped by tmpfs mount)
mkdir -p ~/.ssh
cp ~/known_hosts.bak ~/.ssh/known_hosts

# Set up SSH key if provided via Docker secret
if [ -f /run/secrets/ssh_private_key ] && [ -s /run/secrets/ssh_private_key ]; then
  cp /run/secrets/ssh_private_key ~/.ssh/id_rsa
  chmod 600 ~/.ssh/id_rsa
else
  # No SSH key — force git to use HTTPS for GitHub so plugin installs work
  git config --global url.'https://github.com/'.insteadOf 'git@github.com:'
fi

# Lock down ~/.ssh — no further writes needed
chmod 444 ~/.ssh/known_hosts
[ -f ~/.ssh/id_rsa ] && chmod 400 ~/.ssh/id_rsa
chmod 500 ~/.ssh

# Set git identity from env vars (covers both author and committer)
if [ -n "$GIT_USER_NAME" ] && [ -n "$GIT_USER_EMAIL" ]; then
  git config --global user.name "$GIT_USER_NAME"
  git config --global user.email "$GIT_USER_EMAIL"
fi

# Apply defaults on first run (if the config volume is empty)
mkdir -p ~/.claude
if [ ! -f ~/.claude/settings.json ]; then
  cp ~/settings.default.json ~/.claude/settings.json
  echo "Applied default Claude settings from settings.default.json"
fi
cp ~/CLAUDE.default.md ~/.claude/CLAUDE.md

# Install plugins on first run, update on every startup
if [ -f ~/plugins.sh ]; then
  if [ ! -f ~/.claude/.plugins-installed ]; then
    echo "Installing plugins..."
    ~/plugins.sh && mkdir -p ~/.claude && touch ~/.claude/.plugins-installed
  fi
  echo "Updating plugins..."
  claude plugin list 2>/dev/null | sed -n 's/.*❯ \(\S\+\)/\1/p' | while read -r plugin; do
    claude plugin update "$plugin" 2>/dev/null || true
  done
  find ~/.claude/plugins/cache -name "*.sh" -exec chmod +x {} \;
fi

# Remote-control requires OAuth, not API key. Unset API key and auto-confirm.
if [ "${1:-}" = "remote-control" ]; then
  unset ANTHROPIC_API_KEY
  exec sh -c 'echo y | claude "$@"' -- "$@"
fi

exec claude "$@"
