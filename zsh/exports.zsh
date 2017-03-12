# Yes, really
export PATH=$PATH:~/.bin
export PATH=$PATH:/sbin:/usr/sbin

# Currently this path is appendend to dynamically when picking a ruby version
export PATH=node_modules/.bin:/usr/local/sbin:/usr/local/bin:/usr/local/share/npm/bin:~/.cabal/bin:~/.local/bin:$PATH
export PATH=$PATH:/opt/boxen/homebrew/opt/go/libexec/bin

# Setup terminal, and turn on colors
export TERM=xterm-256color
# export TERM=screen-256color       # for a tmux -2 session (also for screen)
# export TERM=rxvt-unicode-256color # for a colorful rxvt unicode session

# Enable color in grep
export GREP_COLOR='1;33'

# This resolves issues install the mysql, postgres, and other gems with native non universal binary extensions
export ARCHFLAGS='-arch x86_64'

export LESS='-rFnXM --ignore-case --raw-control-chars'
# export PAGER='most'
export PAGER='less'
export EDITOR='vim'
# CTAGS Sorting in VIM/Emacs is better behaved with this in place
export LC_COLLATE=C

export DRIP_SHUTDOWN=30
export EDITOR=vim

# GO lang
export PATH=$PATH:/usr/local/go/bin:~/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Ruby rbenv
export PATH=$PATH:$HOME/.rbenv/bin:$PATH

# npm
export NPM_PACKAGES=$HOME/.npm-packages
export NODE_PATH=$NODE_PATH:$NPM_PACKAGES/lib/node_modules
export PATH=$PATH:$NPM_PACKAGES/bin
# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
# unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH=$(manpath):$NPM_PACKAGES/share/man

# sdkman
export SDKMAN_DIR=$HOME/.sdkman
