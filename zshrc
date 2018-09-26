source =virtualenvwrapper.sh

# If your bundle do use compinit in some way remember to always refresh your .zcompdump file. The easiest way is to run:
# rm ~/.zcompdump*

# POWERLINE9K config before theme load
source ~/dotfiles/powerlevel9k

ANTIGEN_CHECK_FILES=~/dotfiles/antigenrc
ANTIGEN_CHECK_FILES=~/dotfiles/zshrc

# Antigen plugin options
TIPZ_TEXT='⚑ '

source ~/dotfiles/antigen/antigen.zsh
antigen init ~/dotfiles/antigenrc

# more zsh stuff
autoload select-word-style
select-word-style bash
autoload -U zmv
autoload -U zcp

# Remove when antigen gets fixed
source $HOME/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/kubectl/kubectl.plugin.zsh
source $HOME/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/aws/aws.plugin.zsh


############ APPS ############

source ~/dotfiles/kubectl

[ -f /home/aserralle/.travis/travis.sh ] && source /home/aserralle/.travis/travis.sh

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
