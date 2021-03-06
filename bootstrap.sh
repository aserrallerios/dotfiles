#!/bin/bash
set -euxo pipefail

if [ ! "$HOME" == "$PWD" ]; then
  echo "This script is intended to be run from the user's home path: $HOME"
  exit 1
fi

if [ ! -d ".dotfiles" ]; then
  git clone -b master --single-branch --depth 1 https://github.com/aserrallerios/dotfiles.git .dotfiles
fi

cd .dotfiles
./install
