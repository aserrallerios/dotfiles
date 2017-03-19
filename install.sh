#!/bin/bash

git submodule update --init

SCRIPT=`realpath $0`
DOTFILES_FOLDER=`dirname $SCRIPT`

mv $HOME/.antigenrc $HOME/.antigenrc_old
mv $HOME/.powerlevel9k $HOME/.powerlevel9k_old
mv $HOME/.zshrc $HOME/.zshrc_old
mv $HOME/.vimrc $HOME/.vimrc_old
mv $HOME/.vim $HOME/.vim_old
mv $HOME/.gitconfig $HOME/.gitconfig_old
mv $HOME/.gitignore $HOME/.gitignore_old

mv $HOME/.config/terminator $HOME/.config/terminator_old

ln -s $DOTFILES_FOLDER/antigenrc $HOME/.antigenrc
ln -s $DOTFILES_FOLDER/powerlevel9k $HOME/.powerlevel9k
ln -s $DOTFILES_FOLDER/zshrc $HOME/.zshrc
ln -s $DOTFILES_FOLDER/vimrc $HOME/.vimrc
ln -s $DOTFILES_FOLDER/vim $HOME/.vim
ln -s $DOTFILES_FOLDER/gitconfig $HOME/.gitconfig
ln -s $DOTFILES_FOLDER/gitignore $HOME/.gitignore

mkdir $HOME/.dir_colors 2> /dev/null
ln -s $DOTFILES_FOLDER/dircolors-solarized/dircolors.256dark $HOME/.dir_colors/dircolors

ln -s $DOTFILES_FOLDER/ruby/rbenv $HOME/.rbenv
mkdir $HOME/.rbenv/plugins
ln -s $DOTFILES_FOLDER/ruby/ruby-build $HOME/.rbenv/plugins/ruby-build

mkdir $HOME/.config/terminator 2> /dev/null
ln -s $DOTFILES_FOLDER/config/terminator/config $HOME/.config/terminator/config
ln -s $DOTFILES_FOLDER/config/terminator/TerminatorPlugins/plugins $HOME/.config/terminator/plugins

./fonts/install.sh