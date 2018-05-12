function current_shell()
{
  if [[ -n $ZSH_NAME ]]; then
    echo "zsh"
  elif [[ -n $BASH ]]; then
    echo "bash"
  fi
}

function current_os()
{
  if [[ "$(uname)" == "Darwin" ]]; then
    echo "osx"
  elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
    echo "linux"
  elif [[ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]]; then
    echo "mswin"
  fi
}

################################################################################
# System Constants
################################################################################
CURRENT_SHELL=$(current_shell)
CURRENT_OS=$(current_os)
BREW_INSTALLED=$(type brew; echo $?)

################################################################################
# Globals
################################################################################
export PATH="/usr/local/sbin:$PATH"
export PATH=./bin:$PATH

# Default Editor
export EDITOR='vim'

# No cows for ansible
export ANSIBLE_NOCOWS=1

################################################################################
# PHP
################################################################################
# Run composer executables
PATH=./vendor/bin:$HOME/.composer/vendor/bin:$PATH

################################################################################
# Ruby
################################################################################
RBENV_INSTALLED=$(type rbenv; echo $?)
if [[ $RBENV_INSTALLED ]]; then
    eval "$(rbenv init -)"
fi

################################################################################
# Node JS
################################################################################
if [[ $BREW_INSTALLED ]]; then
  source $(brew --prefix nvm)/nvm.sh
fi

export PATH=./node_modules/.bin:$PATH

export NVM_DIR=~/.nvm

################################################################################
# Python
################################################################################
if [[ $CURRENT_OS == "osx" ]]; then
  export PATH=$HOME/Library/Python/2.7/bin:$PATH
fi

################################################################################
# Haskell
################################################################################
if [[ $CURRENT_OS == "osx" ]]; then
  export PATH="$HOME/Library/Haskell/bin:$PATH"
  export PATH="$HOME/.cabal/bin:$PATH"
fi
