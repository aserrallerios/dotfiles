source ~/dotfiles/antigen/antigen.zsh

# If your bundle do use compinit in some way remember to always refresh your .zcompdump file. The easiest way is to run:
# rm ~/.zcompdump*

# POWERLINE9K config before theme load
source ~/dotfiles/powerlevel9k

TIPZ_TEXT='⚑ '

# Disable antigen's cache to always load latest changes from the plugin
export _ANTIGEN_CACHE_ENABLED=true
antigen init ~/dotfiles/antigenrc

# more zsh stuff
autoload select-word-style
select-word-style bash
autoload -U zmv
autoload -U zcp

# dircolors
eval `dircolors ~/.dir_colors/dircolors`

source "$SDKMAN_DIR/bin/sdkman-init.sh"

# autoenv (use zsh-autoenv)
# source ~/.autoenv/activate.sh

#precmd() {
#  if [[ -n "$TMUX" ]]; then
#    tmux setenv "$(tmux display -p 'TMUX_PWD_#D')" "$PWD"
#  fi
#}
