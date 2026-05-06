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

# Dependency checks
check_deps() {
  for cmd in git zsh curl; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
      echo "Error: $cmd is required but not installed." >&2
      exit 1
    fi
  done
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

check_deps

clone_repo() {
  if [ ! -d "$TARGET" ]; then
    echo "Cloning dotfiles ($BRANCH) into $TARGET";
    git clone -b "$BRANCH" --single-branch https://github.com/aserrallerios/dotfiles.git "$TARGET"
  else
    echo "Repo exists; updating ($BRANCH)"
    git -C "$TARGET" fetch origin "$BRANCH" || true
    git -C "$TARGET" checkout "$BRANCH" 2>/dev/null || \
      git -C "$TARGET" checkout -b "$BRANCH" "origin/$BRANCH" 2>/dev/null || true
    git -C "$TARGET" reset --hard "origin/$BRANCH" || true
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
