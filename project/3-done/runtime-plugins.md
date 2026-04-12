# Move plugin install from build time to runtime

Moved plugin installation from Dockerfile to entrypoint.sh. Runs on first startup with a `.plugins-installed` marker to prevent re-running. Eliminated BuildKit secret plumbing from Dockerfile and docker-compose.yml. No API key needed at build time.

## Completed
