#!/usr/bin/env bash
set -euo pipefail
d="$(cd "$(dirname "$0")" && pwd)"

link() {
  local src=$1 dst=$2
  mkdir -p "$(dirname "$dst")"
  if [[ -e $dst && ! -L $dst ]]; then
    mv "$dst" "$dst.bak"
  fi
  ln -sfn "$src" "$dst"
  echo "$dst -> $src"
}

link "$d/cfgs/.zshrc" ~/.zshrc

for p in "$d"/cfgs/config/*; do
  link "$p" ~/.config/"$(basename "$p")"
done
