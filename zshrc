# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# BASEDIR="$( cd "$(dirname "$0")" ; pwd -P )"

############ PLATFORM SPECIFIC ############

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

unameOut="$(uname -m)"
case "${unameOut}" in
    i386)   architecture="386" ;;
    i686)   architecture="386" ;;
    x86_64) architecture="amd64" ;;
    arm64)  architecture="arm64" ;;
    *)      architecture="UNKNOWN:${unameOut}"
esac

case "${machine}" in
	Mac)
    PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
    [[ -f ~/.iterm2_shell_integration.zsh ]] && source ~/.iterm2_shell_integration.zsh
    ;;
esac

case "${architecture}" in
  amd64) export ARCHFLAGS="-arch x86_64" ;;
  arm64) export ARCHFLAGS="-arch arm64" ;;
esac

############ ZSH theme & plugins ############

# Load Zinit plugin manager configuration
[[ ! -f ~/.zsh_zinit.zsh ]] || source ~/.zsh_zinit.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Remove duplicates from PATH
# https://github.com/thoughtbot/dotfiles/pull/440
# https://github.com/thoughtbot/dotfiles/pull/450
export -U PATH

############ Apps ############

# Tool-managed paths
[[ -d "$HOME/.opencode/bin" ]] && export PATH="$HOME/.opencode/bin:$PATH"
[[ -d "$HOME/.lmstudio/bin" ]] && export PATH="$PATH:$HOME/.lmstudio/bin"
