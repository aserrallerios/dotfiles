#!/bin/zsh

# BASEDIR="$( cd "$(dirname "$0")" ; pwd -P )"

############ APPS ############

export SSH_ASKPASS=ksshaskpass
source=virtualenvwrapper.sh

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

############ ZSH theme and plugins ############

# POWERLINE9K config before theme load
source ~/.powerlevel9k

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

#if type brew &>/dev/null; then
#  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
#fi
#rm -f ~/.zcompdump
source ~/.zsh_plugins.sh

# Plugin options
TIPZ_TEXT='⚑ '
NAVI_PATH="$HOME/.cheats"
PATH=$_navi_path:$PATH

# Remove duplicates from PATH
# https://github.com/thoughtbot/dotfiles/pull/440
# https://github.com/thoughtbot/dotfiles/pull/450
export -U PATH

############ Shit added/needed by applications ############

