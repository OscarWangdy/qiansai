#!/usr/bin/env sh
set -eu
if command -v xelatex >/dev/null 2>&1; then
  xelatex -interaction=nonstopmode -halt-on-error main.tex
  xelatex -interaction=nonstopmode -halt-on-error main.tex
elif command -v tectonic >/dev/null 2>&1; then
  tectonic main.tex
else
  printf '%s\n' '需要 XeLaTeX 或 Tectonic。' >&2
  exit 1
fi
cp main.pdf paper.pdf
