#!/usr/bin/env bash

set -euo pipefail

repository="https://github.com/sabinm677/codex-container.git"
repository_ref="${CODEX_CONTAINER_REF:-develop}"
destination=$(pwd -P)

if ! git -C "$destination" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Error: run this script from inside the target Git repository." >&2
  exit 1
fi

for path in .devcontainer sc; do
  if [ -e "$destination/$path" ]; then
    echo "Error: $destination/$path already exists; refusing to overwrite it." >&2
    exit 1
  fi
done

temporary_directory=$(mktemp -d)
trap 'rm -rf "$temporary_directory"' EXIT

git clone --depth 1 --filter=blob:none --sparse --branch "$repository_ref" \
  "$repository" "$temporary_directory/repository"
git -C "$temporary_directory/repository" sparse-checkout set .devcontainer sc
cp -R \
  "$temporary_directory/repository/.devcontainer" \
  "$temporary_directory/repository/sc" \
  "$destination/"

echo "Installed .devcontainer and sc into $destination"
