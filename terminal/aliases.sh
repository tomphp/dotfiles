# Aliases
alias ls='ls -G'
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias ssh="TERM=xterm ssh"

# Applications
alias v="nvim"
alias vdw="nvim +DefaultWorkspace"

# Silly & Fun
alias lsd="echo That\\'s some trippy shit!"

# PHP related
alias r="phpspec run"
alias spec="phpspec desc"

# docker
alias dcleanup='docker rm $(docker ps -aq)'
alias dps='docker ps'
alias dpsa='docker ps -a'
dmysql() {
  docker exec -ti $1 sh -c "TERM=$TERM mysql -u $2 -p"
}

# docker-machine
alias dm='docker-machine'
alias dms='docker-machine start'
alias dme='docker-machine env'
dmle() {
  eval `dme $1`
}
alias dmde='dmle docker'
alias dmip='docker-machine ip'

# docker-compose
alias dc='docker-compose'
alias dcup='docker-compose up'
alias dcr='docker-compose run'

# CR stuff
alias pt='papertrail'

# The fuck
eval "$(thefuck --alias)"
