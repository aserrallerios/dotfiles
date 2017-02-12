# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="custom"

# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim $ZSH/oh-my-zsh.sh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(colored-man-pages colorize command-not-found encode64 nmap node nyan rake rsync sublime fancy-ctrl-z systemd git ruby bower brew bundler ubuntu rails pip python mvn scala sbt gitignore gitfast git-flow sudo terminator themes tmux colorize battery urltools jsontools npm themes zsh_reload common-aliases compleat copydir copyfile cp docker docker-compose encode64 gem get-extras git-hubflow go golang gradle grunt history history-substring-search lein rbenv redis-cli safe-paste zsh-navigation-tools z web-search zsh-completions)
source $ZSH/oh-my-zsh.sh

# zsh-completions
autoload -U compinit && compinit

# Customize to your needs...
source ~/.envs
source ~/.functions
source ~/.aliases
autoload select-word-style
select-word-style bash

zstyle ':completion:*' special-dirs true

setopt NO_SHARE_HISTORY
autoload -U zmv
autoload -U zcp

# dircolors

eval `dircolors ~/.dir_colors/dircolors`

export TERM=xterm-256color        # for common 256 color terminals (e.g. gnome-terminal)
export TERM=screen-256color       # for a tmux -2 session (also for screen)
export TERM=rxvt-unicode-256color # for a colorful rxvt unicode session

