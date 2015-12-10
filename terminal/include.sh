# Location for custom bas config scripts
CONFIG_DIR=$HOME/.dotfiles/terminal

. $CONFIG_DIR/env.sh

# Terminal settings
. $CONFIG_DIR/$CURRENT_SHELL"_only.sh"
. $CONFIG_DIR/aliases.sh

if [ -e ~/.local-profile ]; then
  . ~/.local-profile
fi

vim()
{
  nvim "$@"
}

nvim()
{
  # osx users, use stty -g
  local STTYOPTS="$(stty -g)"
  #local STTYOPTS="$(stty --save)"
  stty stop '' -ixoff
  command nvim "$@"
  stty "$STTYOPTS"
}
