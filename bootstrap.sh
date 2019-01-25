#!/bin/bash
set -euo pipefail

if [ ! "$HOME" == "$PWD" ]; then
  echo "This script is intended to be run from the user's home path: $HOME"
  exit 1
fi

# requirements
# - git
# - zsh

git clone -b master --single-branch --depth 1 https://github.com/aserrallerios/dotfiles.git .dotfiles

cd .dotfiles

./install
