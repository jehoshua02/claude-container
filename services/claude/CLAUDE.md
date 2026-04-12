# Claude Container

You are running inside an isolated Docker container.

## Environment

- Read-only filesystem. You cannot install packages, modify system files, or use sudo.
- Available tools: git, curl, bash, ssh.
- No GUI, no browser, no display.
- /tmp is writable but ephemeral — gone when the container stops.

## File rules

- All work goes in /workspace. Do not write files outside /workspace.
- Do not use global memory. Do not write to ~/.claude/projects/ or any path outside /workspace.
- Do not modify this file.

## Git

- Git identity is configured from environment variables at startup.
- SSH key may or may not be available. If git SSH fails, try HTTPS.

## Instructions

Read /workspace/.instructions/ for use-case specific purpose, workflows, and task instructions.
