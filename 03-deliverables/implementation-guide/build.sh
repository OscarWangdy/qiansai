#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "$0")"
if command -v xelatex >/dev/null 2>&1; then
  xelatex -interaction=nonstopmode -halt-on-error main.tex
  xelatex -interaction=nonstopmode -halt-on-error main.tex
elif command -v tectonic >/dev/null 2>&1; then
  tectonic --keep-logs main.tex
else
  echo '未找到 XeLaTeX 或 Tectonic。请在已有 TeX 环境或 Overleaf 中选择 XeLaTeX 编译。' >&2
  exit 1
fi
cp main.pdf paper.pdf
echo '编译完成：paper.pdf'
