# vim: syntax=sh

# Location for custom bas config scripts
CONFIG_DIR=$HOME/.dotfiles/bash

# Programming language specific settings
. $CONFIG_DIR/php
. $CONFIG_DIR/python
. $CONFIG_DIR/ruby

# Terminal settings
. $CONFIG_DIR/terminal
. $CONFIG_DIR/aliases

vim()
{
    # osx users, use stty -g
    local STTYOPTS="$(stty -g)"
    #local STTYOPTS="$(stty --save)"
    stty stop '' -ixoff
    command vim "$@"
    stty "$STTYOPTS"
}
