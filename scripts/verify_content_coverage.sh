#!/usr/bin/env bash
set -euo pipefail

source_root="${1:-/Users/oscar/Documents/ChatGPT/fpga}"
repo_root="$(cd "$(dirname "$0")/.." && pwd)"
source_hashes="$(mktemp)"
repo_hashes="$(mktemp)"
missing_hashes="$(mktemp)"
trap 'rm -f "$source_hashes" "$repo_hashes" "$missing_hashes"' EXIT

find "$source_root" -type f \
  -not -path '*/.git/*' \
  -not -name '.DS_Store' \
  -print0 \
  | xargs -0 shasum -a 256 \
  | awk '{print $1}' \
  | sort -u > "$source_hashes"

find "$repo_root" -type f \
  -not -path '*/.git/*' \
  -print0 \
  | xargs -0 shasum -a 256 \
  | awk '{print $1}' \
  | sort -u > "$repo_hashes"

comm -23 "$source_hashes" "$repo_hashes" > "$missing_hashes"

if [[ -s "$missing_hashes" ]]; then
  echo "覆盖检查失败：源工作区仍有内容未同步。" >&2
  cat "$missing_hashes" >&2
  exit 1
fi

echo "覆盖检查通过：源工作区中的每一种文件内容都已进入仓库。"
