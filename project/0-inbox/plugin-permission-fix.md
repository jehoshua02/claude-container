# Plugin hook permissions on read-only filesystem

Entrypoint has a `find ... chmod +x` to fix plugin hook scripts. This is plugin-specific code in the entrypoint. What happens when users install plugins inside the container? They might hit the same permission issue and we don't want them modifying tracked claude-container files. Need a generic solution.
