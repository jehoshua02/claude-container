#!/usr/bin/env bash

# --- Marketplaces ---
# Remove and re-add to force a fresh pull (avoids stale cache)
claude plugin marketplace remove jehoshua02
claude plugin marketplace add jehoshua02/claude-marketplace

# --- Plugins ---
# Format: claude plugin install <name>@<marketplace>
claude plugin install stout@jehoshua02
claude plugin install trail@jehoshua02
claude plugin install caveman@jehoshua02
