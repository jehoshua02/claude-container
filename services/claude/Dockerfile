FROM debian:bookworm-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    bash \
    openssh-client \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user
RUN useradd -m -s /bin/bash claude

# Install Claude Code via native installer (as claude user so it lands on their PATH)
USER claude
RUN curl -fsSL https://claude.ai/install.sh | bash
USER root

# Set up workspace directory
RUN mkdir -p /workspace && chown claude:claude /workspace

# Copy default Claude settings (applied on first run if none exist)
COPY --chown=claude:claude settings.default.json /home/claude/settings.default.json

# Copy plugin install script (runs at first startup, not build time)
COPY --chown=claude:claude plugins.sh /home/claude/plugins.sh
RUN chmod +x /home/claude/plugins.sh

# Pre-populate known_hosts so git/ssh never prompts
RUN mkdir -p /home/claude/.ssh && \
    ssh-keyscan -H github.com gitlab.com bitbucket.org > /home/claude/.ssh/known_hosts 2>/dev/null && \
    chown -R claude:claude /home/claude/.ssh && \
    chmod 700 /home/claude/.ssh && \
    chmod 644 /home/claude/.ssh/known_hosts

ENV PATH="/home/claude/.local/bin:${PATH}"
ENV GIT_CONFIG_GLOBAL="/tmp/.gitconfig"
USER claude
WORKDIR /workspace

# Entrypoint sets up SSH key, git config, plugins, and default settings
COPY --chown=claude:claude entrypoint.sh /home/claude/entrypoint.sh
RUN chmod +x /home/claude/entrypoint.sh

ENTRYPOINT ["/home/claude/entrypoint.sh"]
CMD []
