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

case "${machine}" in
	Mac)
		source ~/.iterm2_shell_integration.zsh
		;;
esac

####### App stuff needed by Theme & Plugins #########

export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init --path)"
export NAVI_PATH="$HOME/.cheats:$(navi info cheats-path)"

############ ZSH theme & plugins ############

function antibody-reload() {
	if [ -f ~/.zsh_plugins.sh ]; then
		mv ~/.zsh_plugins.sh ~/.zsh_plugins.sh.old
	fi
	antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
}
if [ ! -f ~/.zsh_plugins.sh ]; then
	antibody-reload
fi
ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"

# quit bugging me, oh-my-zsh!
DISABLE_AUTO_UPDATE="true"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source ~/.zsh_plugins.sh

# Plugin options
TIPZ_TEXT='⚑ '

# Remove duplicates from PATH
# https://github.com/thoughtbot/dotfiles/pull/440
# https://github.com/thoughtbot/dotfiles/pull/450
export -U PATH

############ Apps ############

export SSH_ASKPASS=ksshaskpass
source=virtualenvwrapper.sh

chruby system
