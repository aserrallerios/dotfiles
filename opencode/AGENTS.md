# Global OpenCode Rules

## General

- Be concise and direct in responses. Skip unnecessary preambles.
- When modifying files, read them first to understand context.
- Prefer editing existing files over creating new ones.
- Use `$HOME` instead of hardcoded usernames in paths.
- Guard platform-specific code with `uname` checks on macOS/Linux.

## Code Style

- Follow existing project conventions — match the style of surrounding code.
- Do not add comments, docstrings, or type annotations unless asked.
- Do not refactor or improve code beyond what is requested.

## Shell & Terminal

- Default shell is zsh. Scripts should be POSIX-compatible when possible.
- This environment uses: mise (version manager), zinit (zsh plugins), tmux, neovim (LazyVim).
- Check if tools exist before suggesting installs.

## Git

- Write concise, imperative commit messages.
- Do not amend published commits or force-push without asking.
