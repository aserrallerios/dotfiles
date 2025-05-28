#!/usr/bin/env zsh
# Zinit plugin manager configuration
# This file is sourced by zshrc to load all zsh plugins via zinit

# Initialize zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Zinit helper functions
function zinit-reload() {
	exec zsh
}
function zinit-update-all() {
	zinit update --all
}
function zinit-status() {
	zinit status
}
function zinit-clean() {
	zinit delete --clean
}
function zinit-times() {
	zinit times
}

# Load Oh-My-Zsh framework
zinit snippet OMZL::git.zsh
zinit snippet OMZL::key-bindings.zsh
zinit snippet OMZL::theme-and-appearance.zsh

# Oh-My-Zsh plugins
zinit snippet OMZP::fzf
zinit snippet OMZP::common-aliases
zinit snippet OMZP::aws
zinit snippet OMZP::brew
# macos plugin - DISABLED: causing issues with missing dependencies (music, spotify files)
# The functions it provides (music, spotify) can be replaced with direct commands if needed
# zinit snippet OMZP::macos
zinit snippet OMZP::colored-man-pages
zinit snippet OMZP::colorize
zinit snippet OMZP::command-not-found
zinit snippet OMZP::encode64
zinit snippet OMZP::nmap
zinit snippet OMZP::node
# httpie completion only (no plugin.zsh file)
zinit ice wait lucid as"completion"
zinit snippet https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/httpie/_httpie
zinit snippet OMZP::rake
zinit snippet OMZP::rsync
zinit snippet OMZP::screen
zinit snippet OMZP::sublime
zinit snippet OMZP::vagrant
zinit snippet OMZP::systemd
zinit snippet OMZP::ruby
zinit snippet OMZP::chruby
zinit snippet OMZP::bower
zinit snippet OMZP::bundler
zinit snippet OMZP::ubuntu
zinit snippet OMZP::pip
zinit snippet OMZP::python
zinit snippet OMZP::mvn
# scala completion only (no plugin.zsh file)
zinit ice wait lucid as"completion"
zinit snippet https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/scala/_scala
zinit snippet OMZP::sbt
zinit snippet OMZP::git
zinit snippet OMZP::git-extras
zinit snippet OMZP::github
zinit snippet OMZP::gitignore
# gitfast - download entire plugin directory with SVN (needs git-prompt.sh file)
# zinit ice wait lucid svn
# this does not work!
# zinit snippet OMZ::plugins/gitfast
# git-flow has dependencies - use external plugin instead
zinit ice wait lucid
zinit load bobthecow/git-flow-completion
zinit snippet OMZP::git-prompt
zinit snippet OMZP::git-hubflow
zinit snippet OMZP::sudo
zinit snippet OMZP::themes

# tmux plugin - needs multiple files (tmux.plugin.zsh, tmux.extra.conf, tmux.only.conf)
# Download additional required files automatically on clone and update
# It's a workaround for the fact that zinit does not handle multiple files in a single snippet (bug)
# This should work: zinit ice svn
zinit ice atclone"curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/tmux/tmux.extra.conf -o tmux.extra.conf && curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/tmux/tmux.only.conf -o tmux.only.conf" atpull"%atclone"
zinit snippet OMZP::tmux

# tmuxinator - use Oh-My-Zsh version directly (simple aliases plugin)
zinit snippet OMZP::tmuxinator
zinit snippet OMZP::battery
zinit snippet OMZP::urltools
zinit snippet OMZP::jsontools
zinit snippet OMZP::compleat
zinit snippet OMZP::copypath
zinit snippet OMZP::copyfile
zinit snippet OMZP::cp
zinit snippet OMZP::docker
zinit snippet OMZP::docker-compose
zinit snippet OMZP::gem
zinit snippet OMZP::golang
zinit snippet OMZP::gradle
zinit snippet OMZP::grunt
zinit snippet OMZP::history
# history-substring-search - use external plugin (already loaded at end)
# lein completion only (no plugin.zsh file)
zinit ice wait lucid as"completion"
zinit snippet https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/lein/_lein
zinit snippet OMZP::rbenv
# redis-cli completion only (no plugin.zsh file)
zinit ice wait lucid as"completion"
zinit snippet https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/redis-cli/_redis-cli
zinit snippet OMZP::kubectl
zinit snippet OMZP::z
zinit snippet OMZP::web-search
zinit snippet OMZP::helm
zinit snippet OMZP::terraform
zinit snippet OMZP::dotenv
zinit snippet OMZP::thefuck
zinit snippet OMZP::pyenv
zinit snippet OMZP::npm
zinit snippet OMZP::asdf
zinit snippet OMZP::zsh-navigation-tools

# External plugins with specific loading requirements
# Load navi plugin with proper path and conditional loading (redirect all output to silence)
zinit ice wait lucid pick"shell/navi.plugin.zsh" if'command -v navi >/dev/null 2>&1'
zinit load denisidoro/navi

# Completion plugins - load with fpath handling
zinit ice wait lucid as"completion"
zinit load ahmetb/kubectx
zinit ice wait lucid as"completion"
zinit load Linuxbrew/brew

# Environment and utility plugins - some can wait
zinit ice wait"1" lucid
zinit load Tarrasch/zsh-autoenv
zinit load molovo/tipz
zinit ice wait"1" lucid
zinit load joel-porquet/zsh-dircolors-solarized
zinit ice wait"1" lucid
zinit load MichaelAquilina/zsh-autoswitch-virtualenv

# Plugins from unixorn/zsh-quickstart-kit recommendations - load with delays
zinit ice wait"2" lucid
zinit load chrissicool/zsh-256color
zinit ice wait"2" lucid
zinit load peterhurford/git-it-on.zsh
zinit ice wait"2" lucid
zinit load sharat87/pip-app
zinit ice wait"2" lucid
zinit load skx/sysadmin-util
zinit ice wait"2" lucid
zinit load RobSis/zsh-completion-generator
zinit ice wait"2" lucid
zinit load srijanshetty/docker-zsh
zinit ice wait"2" lucid
zinit load stackexchange/blackbox
zinit ice wait"2" lucid
zinit load unixorn/bitbucket-git-helpers
zinit ice wait"2" lucid
zinit load unixorn/git-extra-commands
zinit ice wait"2" lucid
zinit load unixorn/rake-completion.zshplugin

# Essential zsh-users plugins (order matters!)
# Load completions first and trigger completion initialization
zinit ice wait lucid atload"zicompinit; zicdreplay"
zinit load zsh-users/zsh-completions

# Load fzf-tab (must be after compinit, before autosuggestions/syntax highlighting)
zinit light Aloxaf/fzf-tab

# Load autosuggestions with proper bindings
zinit ice wait lucid atload"_zsh_autosuggest_start"
zinit load zsh-users/zsh-autosuggestions

# Load syntax highlighting (must be loaded after other plugins that bind to ZLE)
zinit ice wait lucid atinit"zicompinit; zicdreplay"
zinit load zsh-users/zsh-syntax-highlighting

# Load history substring search (depends on syntax highlighting)
zinit ice wait lucid
zinit load zsh-users/zsh-history-substring-search

# Custom plugins
zinit load aserrallerios/zsh-files

# Theme - Powerlevel10k (loaded at the end)
zinit ice depth"1"
zinit light romkatv/powerlevel10k

## Plugin options
# quit bugging me, oh-my-zsh!
DISABLE_AUTO_UPDATE="true"
TIPZ_TEXT='⚑ '
