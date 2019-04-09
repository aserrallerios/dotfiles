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
source ~/.zsh_plugins.sh

# Plugin options
TIPZ_TEXT='⚑ '

############ Shit added/needed by applications ############

# Serverless

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/aserralle/.npm-packages/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/aserralle/.npm-packages/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/aserralle/.npm-packages/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /home/aserralle/.npm-packages/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
