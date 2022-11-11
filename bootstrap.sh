#!/bin/bash
set -euxo pipefail

TARGET="$HOME/.dotfiles"

if [ ! -d "$TARGET" ]; then
  git clone -b master --single-branch --depth 1 https://github.com/aserrallerios/dotfiles.git .dotfiles
fi

cd $TARGET
./install
