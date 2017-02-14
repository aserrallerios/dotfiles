#!/bin/bash

git submodule update --init

SCRIPT=`realpath $0`
DOTFILES_FOLDER=`dirname $SCRIPT`

mv $HOME/.zshrc $HOME/.zshrc_old
mv $HOME/.aliases $HOME/.aliases_old
mv $HOME/.envs $HOME/.envs_old
mv $HOME/.functions $HOME/.functions_old
mv $HOME/.vimrc $HOME/.vimrc_old
mv $HOME/.vim $HOME/.vim_old
mv $HOME/.gitconfig $HOME/.gitconfig_old
mv $HOME/.gitignore $HOME/.gitignore_old

mv $HOME/.config/terminator $HOME/.config/terminator_old

ln -s $DOTFILES_FOLDER/zshrc $HOME/.zshrc
ln -s $DOTFILES_FOLDER/aliases $HOME/.aliases
ln -s $DOTFILES_FOLDER/envs $HOME/.envs
ln -s $DOTFILES_FOLDER/functions $HOME/.functions
ln -s $DOTFILES_FOLDER/vimrc $HOME/.vimrc
ln -s $DOTFILES_FOLDER/vim $HOME/.vim
ln -s $DOTFILES_FOLDER/gitconfig $HOME/.gitconfig
ln -s $DOTFILES_FOLDER/gitignore $HOME/.gitignore
ln -s $DOTFILES_FOLDER/autoenv $HOME/.autoenv

mkdir $HOME/.dir_colors 2> /dev/null
ln -s $DOTFILES_FOLDER/dircolors-solarized/dircolors.256dark $HOME/.dir_colors/dircolors

ln -s $DOTFILES_FOLDER/zsh/oh-my-zsh $HOME/.oh-my-zsh
mkdir $HOME/.oh-my-zsh/custom/themes 2> /dev/null
ln -s $DOTFILES_FOLDER/zsh/custom.zsh-theme $HOME/.oh-my-zsh/custom/themes/custom.zsh-theme

# TODO use antigen
mkdir $HOME/.oh-my-zsh/custom/plugins 2> /dev/null
ln -s $DOTFILES_FOLDER/zsh/zsh-completions $HOME/.oh-my-zsh/custom/plugins/zsh-completions
ln -s $DOTFILES_FOLDER/zsh/zsh-syntax-highlighting $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
ln -s $DOTFILES_FOLDER/zsh/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions

ln -s $DOTFILES_FOLDER/ruby/rbenv $HOME/.rbenv
mkdir $HOME/.rbenv/plugins
ln -s $DOTFILES_FOLDER/ruby/ruby-build $HOME/.rbenv/plugins/ruby-build

# TODO move to dev-env
mkdir $HOME/.config/terminator 2> /dev/null
ln -s $DOTFILES_FOLDER/terminator/config $HOME/.config/terminator/config
ln -s $DOTFILES_FOLDER/terminator/TerminatorPlugins/plugins $HOME/.config/terminator/plugins
./fonts/install.sh