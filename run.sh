#!/usr/bin/env bash
set -e

# Load .env if present
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
fi

if [ -z "$ANTHROPIC_API_KEY" ]; then
  echo "Warning: ANTHROPIC_API_KEY is not set. OAuth login required."
fi

# Create volume dirs if they don't exist
mkdir -p volumes/workspace volumes/claude-data
# Ensure files exist so Docker doesn't create them as directories
touch secrets/ssh_key
[ -s volumes/claude.json ] || echo '{}' > volumes/claude.json

# Build image if not already built
docker compose build --quiet

# Run interactively, passing any extra args to claude (e.g. ./run.sh -p "hello")
docker compose run --rm claude "$@"
