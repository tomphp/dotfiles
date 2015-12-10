# Aliases
alias ls='ls -G'
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias ssh="TERM=xterm ssh"

# Applications
alias v="nvim"

# Silly & Fun
alias lsd="echo That\\'s some trippy shit!"

# PHP related
alias r="phpspec run"
alias spec="phpspec desc"

alias bbpr="sh -c \"BITBUCKET_PR=\\\$(awk 'f{print;f=0} /Create pull request for/{f=1}' | sed 's/^remote: *\\(.*\\)$/\1/'); open \\\$BITBUCKET_PR\""
