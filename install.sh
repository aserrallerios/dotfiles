#!/usr/bin/zsh

git submodule update --init

mv ~/.zshrc ~/.zshrc_old
mv ~/.aliases ~/.aliases_old
mv ~/.envs ~/.envs_old
mv ~/.functions ~/.functions_old
mv ~/.vimrc ~/.vimrc_old
mv ~/.vim ~/.vim_old
mv ~/.gitconfig ~/.gitconfig_old
mv ~/.gitignore ~/.gitignore_old

ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/aliases ~/.aliases
ln -s ~/dotfiles/envs ~/.envs
ln -s ~/dotfiles/functions ~/.functions
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/gitignore ~/.gitignore

ln -s ~/dotfiles/oh-my-zsh ~/.oh-my-zsh
mkdir ~/.oh-my-zsh/custom/themes 2> /dev/null
ln -s ~/dotfiles/custom.zsh-theme ~/.oh-my-zsh/themes/custom.zsh-theme

git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

source ~/.zshrc
chsh -s `which zsh`

