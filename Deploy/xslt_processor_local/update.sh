#!/bin/bash
set -euo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")"
docker compose config --quiet
docker compose pull --ignore-buildable
docker compose up -d --wait --wait-timeout 120
docker compose ps
if [[ "${1:-}" == "--logs" ]]; then
    docker compose logs -f
fi
