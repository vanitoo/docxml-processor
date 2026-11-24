"""Conservative GHCR retention for user-owned packages. Never delete untagged manifests."""
import datetime as dt
import json
import os
import re
import subprocess
from urllib.parse import quote

KEEP = 30
AGE_DAYS = 90
CI_TAG = re.compile(r"\d{4}\.\d{2}\.\d{2}-\d{6}-\d+-[0-9a-f]{7}")
SERVICES = ("file_watcher", "pdf_processor", "xslt_processor", "api_processor")


def gh(*args):
    return subprocess.check_output(["gh", "api", *args], text=True)


def candidates(versions, cutoff):
    ordered = sorted(versions, key=lambda v: v["created_at"], reverse=True)
    ci = [v for v in ordered if any(CI_TAG.fullmatch(t) for t in v["metadata"]["container"]["tags"])]
    keep_ids = {v["id"] for v in ci[:KEEP]}
    for v in ci:
        tags = v["metadata"]["container"]["tags"]
        if v["id"] in keep_ids or not tags or not all(CI_TAG.fullmatch(t) for t in tags):
            continue
        if dt.datetime.fromisoformat(v["created_at"].replace("Z", "+00:00")) < cutoff:
            yield v


def main():
    owner, repo = os.environ["OWNER"], os.environ["REPO"]
    apply = os.environ.get("APPLY", "false").lower() == "true"
    cutoff = dt.datetime.now(dt.timezone.utc) - dt.timedelta(days=AGE_DAYS)
    for service in SERVICES:
        package = quote(f"{repo}/{service}".lower(), safe="")
        endpoint = f"/users/{owner}/packages/container/{package}/versions"
        pages = json.loads(gh("--paginate", "--slurp", endpoint + "?per_page=100"))
        versions = [v for page in pages for v in page]
        if not any("latest" in v["metadata"]["container"]["tags"] for v in versions):
            raise RuntimeError(f"{service}: latest missing; refusing cleanup")
        for v in candidates(versions, cutoff):
            print(f"{'DELETE' if apply else 'DRY RUN'} {service} {v['id']} {v['metadata']['container']['tags']}", flush=True)
            if apply:
                # Recheck current tags immediately before deleting.
                current = json.loads(gh(f"{endpoint}/{v['id']}"))
                tags = current["metadata"]["container"]["tags"]
                if tags and all(CI_TAG.fullmatch(t) for t in tags):
                    gh("--method", "DELETE", f"{endpoint}/{v['id']}")


if __name__ == "__main__":
    main()
