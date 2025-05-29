#!/usr/bin/env zsh
# Zinit plugin manager configuration
# This file is sourced by zshrc to load all zsh plugins via zinit

# Initialize zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# see: https://github.com/zdharma-continuum/zinit/discussions/651
_fix-omz-plugin() {
    [[ -f ./._zinit/teleid ]] || return 1
    local teleid="$(<./._zinit/teleid)"
    local pluginid
    for pluginid (${teleid#OMZ::plugins/} ${teleid#OMZP::}) {
        [[ $pluginid != $teleid ]] && break
    }
    (($?)) && return 1
    print "Fixing $teleid..."
    git clone --quiet --no-checkout --depth=1 --filter=tree:0 https://github.com/ohmyzsh/ohmyzsh
    cd ./ohmyzsh
    git sparse-checkout set --no-cone /plugins/$pluginid
    git checkout --quiet
    cd ..
    local file
    for file (./ohmyzsh/plugins/$pluginid/*~(.gitignore|*.plugin.zsh)(D)) {
        print "Copying ${file:t}..."
        cp -R $file ./${file:t}
    }
    rm -rf ./ohmyzsh
}

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
zinit ice wait lucid
zinit load bobthecow/git-flow-completion
zinit snippet OMZP::git-prompt
zinit snippet OMZP::git-hubflow
zinit snippet OMZP::sudo
zinit snippet OMZP::themes

zinit wait lucid atpull"%atclone" atclone"_fix-omz-plugin" for OMZ::plugins/{git-flow,gitfast,tmux,extract,macos}

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
# history-substring-search - use external plugin (already loaded at end)
zinit snippet OMZP::history
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

zinit wait lucid atpull"%atclone" atclone"_fix-omz-plugin" for OMZP::zsh-navigation-tools

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
