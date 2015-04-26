#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BACKUP_DIR=$DIR/backup

show_help=off
full_install=off
vim_only=off
with_vim_plugins=off
with_git=off
with_tmux=off
with_powerline=off

# Gather command line options
while [ $# -gt 0 ]
do
    case "$1" in
        --with-vim-plugins) with_vim_plugins=on;;
        --with-git) with_git=on;;
        --with-tmux) with_tmux=on;;
        --with-powerline) with_powerline=on;;
        --full-install) full_install=on;;
        --vim-only) vim_only=on;;
        *) show_help=on;;
    esac
    shift
done

function show_help {
    echo "Tom Oram's dotfiles installer"
    echo "./install.sh --full-install|--vim-only [--with-vim-plugins --with-git --with-tmux --with-powerline]"
    echo
    echo "This installer does not install vim, tmux, powerline or git - it"
    echo "simply installs the config."
    echo
    echo "When this script is run, this directory will be moved to"
    echo "$HOME/.dotfiles"
    echo
    echo "Any existing config files will then be moved to"
    echo "$HOME/.dotfiles/backup"
    echo
    echo "--vim-only installs only the VIM config with no VIM plugins. To"
    echo "install plugins or config for the other applications, use the"
    echo "--with-* arguments."
    echo
    echo "--full-install is the same as --vim-only with all --with-*"
    echo "arguments provided also."

    exit 1
}

function verify_arguments {
    if [ $vim_only = "off" ] && [ $full_install = "off" ]; then
        echo "You must choose --vim-only OR --full-install!"
        echo
        show_help=on
    fi

    if [ $vim_only = "on" ] && [ $full_install = "on" ]; then
        echo "You must choose --vim-only OR --full-install!"
        echo
        show_help=on
    fi

    if [ $full_install = "on" ]; then
        with_vim_plugins=on
        with_git=on
        with_tmux=on
        with_powerline=on
    fi

    if [ $show_help = "on" ]; then
        show_help
    fi
}

function move_directory {
    if [ -f  $HOME/.dotfiles ]; then
        echo "$HOME/.dotfiles already exists."
        exit 2
    fi

    cd "$HOME"
    mv "$DIR" "$HOME/.dotfiles"
    cd "$HOME/.dotfiles"
}

function backup_and_link {
    link="$HOME/$1"
    actual="$HOME/.dotfiles/$2"

    backup_dir="$HOME/.dotfiles/backup"

    if [ ! -f "$backup_dir" ]; then
        echo "- Creating backup directory $backup_dir"
        mkdir "$backup_dir"
    fi

    if [ -f "$link" ]; then
        echo "- Backing up $link"
        mv "$link" "$backup_dir"
    fi

    echo "- Linking $link to $actual"
    ln -s "$actual" "$link"
}

function install_bash_profile {
    echo "Installing .bash_profile"
    backup_and_link .bash_profile bash_profile
}

function install_zsh_profile {
    echo "Installing .zshrc"
    backup_and_link .zshrc zshrc
}

function install_vim_config {
    echo "Installing VIM config"
    backup_and_link .vimrc vimrc
}

function install_vim_plugins {
    echo "Installing VIM plugins"
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +BundleInstall +qall
}

function install_powerline_config {
    echo "Installing powerline config"
    backup_and_link .config/powerline powerline
}

function install_git_config {
    echo "Installing git config"
    backup_and_link .gitconfig gitconfig
    backup_and_link .gitignore global_gitignore
}

function install_tmux_config {
    echo "Installing tmux config"
    backup_and_link .tmux.conf tmux.conf
}

verify_arguments
move_directory
install_bash_profile
install_zsh_profile
install_vim_config

if [ $with_vim_plugins = "on" ]; then
    install_vim_plugins
fi

if [ $with_powerline = "on" ]; then
    install_powerline_config
fi

if [ $with_git = "on" ]; then
    install_git_config
fi

if [ $with_tmux = "on" ]; then
    install_tmux_config
fi
