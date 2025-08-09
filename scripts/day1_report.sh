#!/usr/bin/env bash
set -euo pipefail
mkdir -p reports

docker version > reports/day1-docker-version.txt 2>&1 || true
docker info    > reports/day1-docker-info.txt    2>&1 || true
docker system df > reports/day1-system-df.txt    2>&1 || true
docker image ls   > reports/day1-images.txt      2>&1 || true
docker ps -a      > reports/day1-containers.txt  2>&1 || true

cat > reports/day1-notes.md <<'MD'
# Day 1 Notes — Install & Sanity Check
- OS: <fill>
- Docker Desktop/Engine version: see files above
- WSL2 enabled (Windows)? <yes/no>
- First runs: hello-world, alpine echo, python:3.12-slim
- Python bases compared: 3.12-slim vs 3.12-bookworm
- Key learnings:
  - slim vs bookworm trade-offs
  - docker system df to monitor disk usage
  - images, containers, volumes = separate concepts
MD

echo "Report generated in ./reports"
