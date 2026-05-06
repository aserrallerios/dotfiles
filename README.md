# dotfiles

Personal dotfiles managed with [dotbot](https://github.com/anishathalye/dotbot).

## Quick start

```bash
git clone --recursive https://github.com/aserrallerios/dotfiles.git ~/.dotfiles
cd ~/.dotfiles && ./install
```

Or bootstrap from scratch (clones + installs):

```bash
curl -fsSL https://raw.githubusercontent.com/aserrallerios/dotfiles/master/bootstrap.sh | bash
```

## What's included

| Component            | Tool                                                               | Config                           |
| -------------------- | ------------------------------------------------------------------ | -------------------------------- |
| Shell                | zsh + [zinit](https://github.com/zdharma-continuum/zinit)          | `zshrc`, `zsh_zinit.zsh`         |
| Prompt               | [Powerlevel10k](https://github.com/romkatv/powerlevel10k)          | `p10k.zsh`                       |
| Terminal multiplexer | tmux + [TPM](https://github.com/tmux-plugins/tpm)                  | `tmux/tmux.conf`                 |
| Editor               | [Neovim](https://neovim.io/) + [LazyVim](https://www.lazyvim.org/) | `nvim/`                          |
| Git                  | git aliases & config                                               | `git/gitconfig`, `git/gitignore` |
| Navi Cheats          | [navi](https://github.com/denisidoro/navi)                         | `navi/`                          |
| Cheatsheets          | [cheat](https://github.com/cheat/cheat)                            | `cheat/`                         |

## Structure

```
dotfiles/
├── bootstrap.sh          # Clone & install from scratch
├── install                # Run dotbot
├── install.conf.yaml      # Dotbot link/shell directives
├── zshrc                  # Main shell config
├── zsh_zinit.zsh          # Zinit plugin declarations
├── p10k.zsh               # Powerlevel10k theme config
├── nvim/                  # Neovim config (LazyVim)
│   ├── init.lua
│   └── lua/
│       ├── config/        # options, keymaps, autocmds
│       └── plugins/       # custom plugin specs
├── tmux/
│   ├── tmux.conf          # Main tmux config
│   └── plugins/tpm/       # TPM submodule
├── git/
│   ├── gitconfig
│   └── gitignore
├── navi/                  # navi cheatsheets
├── cheat/                 # cheat config
└── dotbot/                # dotbot submodule
```

## What gets linked

| Source             | Target                     |
| ------------------ | -------------------------- |
| `zshrc`            | `~/.zshrc`                 |
| `zsh_zinit.zsh`    | `~/.zsh_zinit.zsh`         |
| `p10k.zsh`         | `~/.p10k.zsh`              |
| `git/gitconfig`    | `~/.gitconfig`             |
| `git/gitignore`    | `~/.gitignore`             |
| `tmux/tmux.conf`   | `~/.tmux.conf`             |
| `tmux/plugins/tpm` | `~/.tmux/plugins/tpm`      |
| `nvim/`            | `~/.config/nvim`           |
| `navi/`            | `~/.navi`                  |
| `opencode/`        | `~/.config/opencode`       |
| `cheat/conf.yml`   | `~/.config/cheat/conf.yml` |

## Prerequisites

- macOS or Linux
- git
- zsh (default shell)
- [Homebrew](https://brew.sh/) (macOS)
- A [Nerd Font](https://www.nerdfonts.com/) for terminal icons

## Post-install

- Open tmux and press `prefix + I` to install TPM plugins
- Open nvim — LazyVim will auto-install on first launch
- Run `p10k configure` if you want to reconfigure the prompt

## Updating

```bash
cd ~/.dotfiles && git pull && ./install
```

## Code Quality with Megalinter

This repo uses [Megalinter](https://megalinter.io/) to validate code quality across all file types.

### What's enabled

Megalinter runs **30+ linters** covering:
- **Shell**: bash, shellcheck, shfmt, zsh
- **Config files**: YAML, JSON, TOML, XML, INI
- **Documentation**: Markdown, spell check, link checks
- **Languages**: Python, Lua
- **DevOps**: Dockerfile, Ansible, Terraform
- **Security**: Secret detection, gitleaks

### Quick check

Run megalinter locally:

```bash
./run-megalinter.sh
```

Returns:
- Exit code `0` — All checks passed ✓
- Exit code `1` — Issues found ✗

### Pre-commit hook

Megalinter runs automatically on `git commit`. To skip it:

```bash
git commit --no-verify
```

### CI/CD

A GitHub Actions workflow (`.github/workflows/megalinter.yml`) runs megalinter on every push to `master` and reports build status.

### Configuration

Megalinter settings are in `.megalinter.yml`:
- Only validates changed files (not full codebase) for faster checks
- Softened rules — warnings don't block commits
- Generated files (like `lazy-lock.json`) are excluded

To run on the full codebase:

```bash
VALIDATE_ALL_CODEBASE=true ./run-megalinter.sh
```
