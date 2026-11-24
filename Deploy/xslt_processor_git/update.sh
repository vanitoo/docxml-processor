#!/bin/bash
set -euo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")"
docker compose config --quiet
docker compose pull --ignore-buildable
# Refuse mixed revisions if a registry promotion is incomplete.
revision=""
for service in file_watcher pdf_processor xslt_processor api_processor; do
    image="ghcr.io/vanitoo/docxml-processor/$service:latest"
    current=$(docker image inspect --format '{{index .Config.Labels "org.opencontainers.image.revision"}}' "$image")
    version=$(docker image inspect --format '{{index .Config.Labels "org.opencontainers.image.version"}}' "$image")
    [[ -n "$current" && "$current" != "<no value>" && -n "$version" && "$version" != "<no value>" ]] || { echo "Missing image metadata: $image" >&2; exit 1; }
    identity="$current:$version"
    [[ -z "$revision" || "$revision" == "$identity" ]] || { echo "Mixed image versions; deployment aborted" >&2; exit 1; }
    revision="$identity"
done
echo "Deploying $revision"
docker compose up -d --wait --wait-timeout 120
docker compose ps
if [[ "${1:-}" == "--logs" ]]; then
    docker compose logs -f
fi
