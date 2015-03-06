# Python's PIP bin direcotry
PATH=$HOME/Library/Python/2.7/bin:$PATH

# Run composer & node executables
PATH=./vendor/bin:~/.composer/vendor/bin:$PATH

# Powerline
. $HOME/Library/Python/2.7/lib/python/site-packages/powerline/bindings/bash/powerline.sh

# Switch bash to VI mode
#set -o vi

# Aliases
alias ls='ls -G'
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias lsd="echo That\\'s some trippy shit!"
alias r="phpspec run"
alias spec="phpspec desc"
alias v="vim"
alias ssh="TERM=xterm ssh"
alias fucking="sudo"

# bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
