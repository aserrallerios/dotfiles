#!/usr/bin/zsh

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

ln -s $DOTFILES_FOLDER/zshrc $HOME/.zshrc
ln -s $DOTFILES_FOLDER/aliases $HOME/.aliases
ln -s $DOTFILES_FOLDER/envs $HOME/.envs
ln -s $DOTFILES_FOLDER/functions $HOME/.functions
ln -s $DOTFILES_FOLDER/vimrc $HOME/.vimrc
ln -s $DOTFILES_FOLDER/vim $HOME/.vim
ln -s $DOTFILES_FOLDER/gitconfig $HOME/.gitconfig
ln -s $DOTFILES_FOLDER/gitignore $HOME/.gitignore

wget https://storage.googleapis.com/kubernetes-release/release/v1.3.0/bin/linux/amd64/kubectl -O $HOME/bin

mv $HOME/.config/terminator $HOME/.config/terminator_old
ln -s $DOTFILES_FOLDER/config/terminator $HOME/.config/

mv $HOME/.zsh_history $HOME/.zsh_history_old
ln -sf $DOTFILES_FOLDER/zsh_history $HOME/.zsh_history

ln -s $DOTFILES_FOLDER/oh-my-zsh $HOME/.oh-my-zsh
mkdir $HOME/.oh-my-zsh/custom/themes 2> /dev/null
ln -s $DOTFILES_FOLDER/custom.zsh-theme $HOME/.oh-my-zsh/custom/themes/custom.zsh-theme

ln -s $DOTFILES_FOLDER/rbenv $HOME/.rbenv
mkdir $HOME/.rbenv/plugins
ln -s $DOTFILES_FOLDER/ruby-build $HOME/.rbenv/plugins/ruby-build

source $HOME/.zshrc
chsh -s `which zsh`
