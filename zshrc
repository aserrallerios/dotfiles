source =virtualenvwrapper.sh

############ ZSH ############

# POWERLINE9K config before theme load
source ~/dotfiles/powerlevel9k

source <(antibody init)
ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"
antibody bundle < ~/dotfiles/zsh_plugins.txt

# Plugin options
TIPZ_TEXT='⚑ '

############ APPS ############

source ~/dotfiles/kubectl

source /usr/share/chruby/chruby.sh

export NPM_PACKAGES=$HOME/.npm-packages
export NODE_PATH=$NODE_PATH:$NPM_PACKAGES/lib/node_modules
export PATH=$PATH:$NPM_PACKAGES/bin
# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
# unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH=$(manpath):$NPM_PACKAGES/share/man

export PATH=$PATH:/usr/local/go/bin:~/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin


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
