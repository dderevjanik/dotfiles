#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

scriptDir=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")
dir=dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="tmux.conf gitconfig alliases dircolors"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving existing file from ~/.$file to ~/$olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink $scriptDir/$dir/$file to ~/"
    ln -s $scriptDir/$dir/.$file ~/.$file
done
