FROM node:22-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    bash \
    openssh-client \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install Claude Code globally
RUN npm install -g @anthropic-ai/claude-code

# Create a non-root user
RUN useradd -m -s /bin/bash claude

# Set up workspace directory
RUN mkdir -p /workspace && chown claude:claude /workspace

# Copy default Claude settings (applied on first run if none exist)
COPY --chown=claude:claude settings.default.json /home/claude/settings.default.json

# Copy plugin install script (runs at first startup, not build time)
COPY --chown=claude:claude plugins.sh /home/claude/plugins.sh
RUN chmod +x /home/claude/plugins.sh

USER claude
WORKDIR /workspace

# Entrypoint sets up SSH key, git config, plugins, and default settings
COPY --chown=claude:claude entrypoint.sh /home/claude/entrypoint.sh
RUN chmod +x /home/claude/entrypoint.sh

ENTRYPOINT ["/home/claude/entrypoint.sh"]
CMD []
