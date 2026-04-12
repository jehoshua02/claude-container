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

## Cost efficiency

- Terse responses. No filler, no narration. Run tools first, show result, stop.
- Read only the sections of files needed, not whole files.
- Never read PDFs directly. Ask user to extract text first.
- Delegate tasks to subagents. Pass the appropriate model (`haiku`/`sonnet`/`opus`). Return only the essential result.
- Main thread orchestrates only. No unnecessary detail accumulation.
- Document key details and decisions in task files as they come up.
- If context fills: output a short list of relevant file names, then /clear.

Model selection:
- Haiku: quick answers, simple tasks
- Sonnet: code, data analysis, general questions, summaries
- Opus: complex architecture, critical bugs, nuanced research

## Instructions

Read /workspace/.instructions/ for use-case specific purpose, workflows, and task instructions.
