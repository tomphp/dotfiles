# vim: syntax=sh

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/tomoram/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

MY_SHELL=zsh

# Location for custom bas config scripts
. $HOME/.dotfiles/terminal/include
