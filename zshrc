############ APPS ############

source=virtualenvwrapper.sh
source ~/dotfiles/kubernetes/alias

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
		export PATH="/usr/local/opt/python/libexec/bin:$PATH"
		export JAVA_HOME=$(/usr/libexec/java_home)
		;;
esac

############ ZSH theme and plugins ############

# POWERLINE9K config before theme load
source ~/dotfiles/powerlevel9k

function antibody-reload() {
	if [ -f ~/.zsh_plugins.sh ]; then
		mv ~/.zsh_plugins.sh ~/.zsh_plugins.sh.old
	fi
	antibody bundle < ~/dotfiles/zsh_plugins.txt > ~/.zsh_plugins.sh
}
if [ ! -f ~/.zsh_plugins.sh ]; then
	antibody-reload
fi
ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"
source ~/.zsh_plugins.sh

# Plugin options
TIPZ_TEXT='⚑ '

############ Shit added/needed by applications ############

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/aserralle/.npm-packages/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/aserralle/.npm-packages/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/aserralle/.npm-packages/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /home/aserralle/.npm-packages/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
source /usr/share/chruby/chruby.sh

# Default ruby other than the system ruby
chruby `chruby | tr -d '* '`

export NPM_PACKAGES=$HOME/.npm-packages
export NODE_PATH=$NODE_PATH:$NPM_PACKAGES/lib/node_modules
export PATH=$PATH:$NPM_PACKAGES/bin
# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
# unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH=$(manpath):$NPM_PACKAGES/share/man

export PATH=$PATH:/usr/local/go/bin:~/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
