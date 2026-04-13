#!/usr/bin/env bash
set -Eeuo pipefail

trap 'echo "[dotfiles bootstrap] Failed at line $LINENO" >&2' ERR

TARGET="$HOME/.dotfiles"
BRANCH="master"
DRY_RUN=0

usage() {
  cat <<EOF
dotfiles bootstrap
Usage: bootstrap.sh [--branch <name>] [--dry-run]
Options:
  --branch <name>  Use a different git branch (default: master)
  --dry-run        Show actions without executing
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    -b|--branch)
      BRANCH="$2"; shift 2;;
    --dry-run)
      DRY_RUN=1; shift;;
    -h|--help)
      usage; exit 0;;
    *)
      echo "Unknown argument: $1" >&2; usage; exit 1;;
  esac
done

clone_repo() {
  if [ ! -d "$TARGET" ]; then
    echo "Cloning dotfiles ($BRANCH) into $TARGET";
    git clone -b "$BRANCH" --single-branch --depth 1 https://github.com/aserrallerios/dotfiles.git "$TARGET"
  else
    echo "Repo exists; updating ($BRANCH)";
    git -C "$TARGET" fetch origin "$BRANCH" --depth 1 || true
    git -C "$TARGET" checkout "$BRANCH" || true
    git -C "$TARGET" pull --ff-only || true
  fi
}

if [ "$DRY_RUN" -eq 1 ]; then
  echo "[DRY-RUN] Would clone/update repo at $TARGET (branch: $BRANCH)";
  echo "[DRY-RUN] Would run install script";
  exit 0
fi

clone_repo
cd "$TARGET"
./install
