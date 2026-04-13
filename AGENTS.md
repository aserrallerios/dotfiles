# AGENTS.md — Dotfiles Repository

## Repository Context

This is a personal dotfiles repo bootstrapped via `dotbot`. It targets macOS (Apple Silicon primary) and Linux. The repo is cloned to `~/.dotfiles` and symlinks config files into `$HOME`.

## Agent Guidelines

### General Rules

- **Never commit secrets, tokens, or credentials** to this repo. Use `~/.sensible.dotfiles` (separate private repo) for anything sensitive.
- **Prefer editing existing files** over creating new ones. Dotfiles should stay minimal.
- **Guard platform-specific code** with `uname` checks or `[[ -f ... ]]` guards. This repo is used on both macOS and Linux.
- **Use `$HOME`** instead of hardcoded `/Users/<username>` paths.
- **Do not pipe curl/wget to bash** in install scripts. Clone repos or check if tools are already installed first.

### File Conventions

| Path                     | Purpose                                                         | Format               |
| ------------------------ | --------------------------------------------------------------- | -------------------- |
| `zshrc`                  | Main shell config — platform detection, env vars, sources zinit | Zsh                  |
| `zsh_zinit.zsh`          | All zinit plugin declarations — isolated and portable           | Zsh                  |
| `p10k.zsh`               | Powerlevel10k config — regenerated via `p10k configure`         | Zsh (auto-generated) |
| `nvim/`                  | Neovim config with LazyVim — Lua-based                          | Lua                  |
| `nvim/lua/plugins/*.lua` | Custom plugin specs — each file returns a table                 | Lua                  |
| `tmux/tmux.conf`         | Tmux config with TPM plugins                                    | tmux conf            |
| `git/gitconfig`          | Git aliases, merge tools, includes                              | Git config INI       |
| `install.conf.yaml`      | Dotbot directives — what gets linked/cleaned/run                | YAML                 |
| `navi/`                  | Navi cheatsheet files                                           | Navi format          |

### When Modifying Shell Config

- **zshrc**: Only for platform detection, env vars, and sourcing other files. Keep it lean.
- **zsh_zinit.zsh**: All plugin management goes here. Use `zinit ice wait lucid` for lazy loading where possible.
- **Do not add** plugins for tools you don't actively use — each plugin adds to shell startup time.
- Run `zsh-time` (defined in zsh-files) to benchmark changes.
- The `zsh-files` repo (github.com/aserrallerios/zsh-files) is loaded as a zinit plugin and provides core aliases, functions, exports, and tool configs.

### When Modifying Neovim Config

- `nvim/init.lua` bootstraps lazy.nvim and loads LazyVim. Don't put plugin specs here.
- Add new plugins as separate files in `nvim/lua/plugins/` — one concern per file.
- Config overrides go in `nvim/lua/config/` (options.lua, keymaps.lua, autocmds.lua).
- Use LazyVim extras (`import = "lazyvim.plugins.extras.lang.X"`) for language support rather than manual LSP/formatter setup.

### When Modifying Tmux Config

- Single file: `tmux/tmux.conf`. Plugins via TPM.
- After adding a plugin, remind the user to press `prefix + I` inside tmux to install it.
- Keep history-limit sane (50000 max).

### When Modifying Git Config

- The gitconfig includes `~/.gitconfig.user` for machine-specific overrides.
- Work configs use `includeIf` with `gitdir:` — don't put work-specific settings in the main config.
- Alias names must not collide. Check existing aliases before adding new ones.

### Dotbot / install.conf.yaml

- Links are source → target. Source paths are relative to repo root.
- The `shell` section runs commands — guard installs with existence checks to make re-runs idempotent.
- Don't add `curl | bash` commands. Prefer checking if a tool exists first.

### Testing Changes

```bash
# Dry-run bootstrap
./bootstrap.sh --dry-run

# Re-run dotbot linking
./install

# Test shell startup
zsh -i -c exit

# Benchmark shell startup
time zsh -i -c exit
```

## MCP & Skills Integration

This dotfiles repo does **not** require MCP servers. However, when agents work across the multi-root workspace that includes this repo alongside `.sensible.dotfiles` and `.dev-env`:

- **`.dotfiles`** — Public configs, safe to commit and share.
- **`.sensible.dotfiles`** — Private/work configs (AWS, SSH keys, work gitconfigs). Never mix content between repos.
- **`.dev-env`** — Ansible playbooks for installing system packages. When a dotfile needs a new tool, the install task goes in `.dev-env`, not here.
- **`zsh-files`** — Zsh plugin repo, published to GitHub. Changes here affect all machines via `zinit update`.

### Relevant Skills

When working on this repo, these skills may be useful:

- **agent-customization** — For creating/editing `.instructions.md`, `.agent.md`, or `AGENTS.md` files.
- No Azure/cloud skills are relevant to this repo.

## Things to Avoid

- Don't add editor configs for editors you don't use (Sublime, Emacs, etc.)
- Don't add Linux-only tools without platform guards
- Don't store migration logs, AI conversation artifacts, or ephemeral scripts in the repo
- Don't duplicate functionality between `zsh-files` plugin and `zshrc`/`zsh_zinit.zsh`
