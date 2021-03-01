# Navigation
alias ls="ls --color=auto"
alias l="ls --color=auto"
alias ll="ls -Al"
alias la="ls -A"
alias lla="ls -lA"
alias lal="ls -Al"

alias c="clear"
alias cl="clear"
alias cdd="cd ~/dev"

alias treee="tree -a -I '.git'"

mdc ()
{
  mkdir -p -- "$1" &&
  cd -P -- "$1"
}

# Docker
alias dk="docker kill";
alias dps="docker ps";
alias dka="echo Killing containers:&& docker ps -q | xargs docker kill";
alias dwatch="watch docker ps"

# Git
alias gst="git status"
alias gs="git status"
alias gc="git commit"
alias gd="git diff"
alias gcm="git checkout master"
alias gco="git checkout"
alias gcoo="git checkout -- ."
alias gpull="git pull"
alias gpush="git push"
alias gp="git pull"
alias gf="git fetch"

# Python
alias py="python3.7";
alias python="python3.7";
alias python3="python3.7";
alias py2="python2.7"
alias python2="python2.7";

# Vim
alias v=nvim
alias vi=nvim
alias vim=nvim
alias nv=nvim
alias nvi=nvim

# Utils
template ()
{
  cp ~/Templates/"$1"/* . &&
  nix-shell
}
