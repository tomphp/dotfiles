#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BACKUP_DIR=~/dotfiles_backup

echo "Existing files will be backed up to $BACKUP_DIR"
echo "Installation directory is $DIR"

echo 

mkdir -p $BACKUP_DIR/.config

for FILE in .vimrc .bash_aliases .bash_custom .config/powerline .tmux.conf
do
    if [ -e ~/$FILE ]; then
        echo "Backing up $FILE"
        mv ~/$FILE $BACKUP_DIR/$FILE
    fi

    echo "Creating soft link for $FILE"
    ln -s $DIR/$FILE ~/$FILE
done

# Create the tags directory
#mkdir ~/.vim.tags

# Install bundles
echo git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
echo vim +BundleInstall +qall

echo "Make sure you have added the following code to you .bashrc file"

echo

echo "# Custom bash settings
if [ -f ~/.bash_custom ]; then
    . ~/.bash_custom
fi"
