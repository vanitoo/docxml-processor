#!/bin/bash
set -euo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")"
docker compose config --quiet
docker compose pull --ignore-buildable
# Bind mounts override image ownership. Check access without changing host permissions.
docker compose run --rm --no-deps --entrypoint sh api_processor -c 'test -w /app/Data' || {
    echo "API cannot write /app/Data; grant UID 1654 access to the host Data directory before deployment" >&2
    exit 1
}
docker compose up -d --wait --wait-timeout 120
docker compose ps
if [[ "${1:-}" == "--logs" ]]; then
    docker compose logs -f
fi
