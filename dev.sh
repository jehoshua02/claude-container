#!/usr/bin/env bash
# Start a Claude Code session with remote control enabled
exec claude --remote-control "Claude Container Dev" "$@"
