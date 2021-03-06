#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/.dotfiles                    # dotfiles directory
olddir=~/.dotfiles_old             # old dotfiles backup directory
files="vimrc zshrc ctags vim gitignore_global gitconfig tmux.conf zprofile"   # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
printf "Creating $olddir for backup of any existing dotfiles in ~ ...\n"
mkdir -p $olddir
printf "done\n\n"

# change to the dotfiles directory
printf "Changing to the $dir directory ...\n"
cd $dir
printf "done\n\n"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    printf "Moving any existing dotfiles from ~ to $olddir\n"
    mv ~/.$file $olddir
    printf "Creating symlink to $file in home directory.\n\n"
    ln -s $dir/.$file ~/.$file
done

mkdir -p ~/.ctags.d
ln -s $dir/.ctags ~/.ctags.d/ctags.ctags

mkdir -p ~/.config
ln -s $dir/nvim ~/.config/nvim

printf "Installing plugings\n"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qa
printf "done\n\n"

printf "Cloning into oh-my-zsh\n"
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
