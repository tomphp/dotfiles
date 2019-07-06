#!/usr/bin/env bash

set -exufo pipefail

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Stack
brew install stack

# export GPG_TTY=$(tty)

# rbenv init

# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# code --install-extension k--kato.intellij-idea-keybindings
# code --install-extension justusadam.language-haskell

# brew install mas
# mas install 585829637 # Todoist
# mas install 475305873 # Switch reader
