#!/usr/bin/env bash
set -e

# Install plugins at build time.
#
# Edit this script to add/remove marketplaces and plugins.
# Then rebuild: docker compose build
#
# Plugins are installed to user scope (~/.claude/) so they persist
# via the claude-config volume.

# --- Marketplaces ---
claude plugin marketplace add jehoshua02/claude-marketplace

# --- Plugins ---
# Format: claude plugin install <name>@<marketplace>
claude plugin install stout@jehoshua02/claude-marketplace
claude plugin install trail@jehoshua02/claude-marketplace
claude plugin install claude-plugin-output-style-caveman@jehoshua02/claude-marketplace
