alias cdd="cd ~/dev"

alias dk="docker kill"
alias dps="docker ps"
alias dka="echo Killing containers:&& docker ps -q | xargs docker kill"

alias ls="ls --color=auto"
alias l="ls"
alias ll="ls -Al"
alias la="ls -A"

alias c="clear"

alias treee="tree -a -I '.git'"

alias gst="git status"
alias gc="git commit"
alias gd="git diff"
alias gcm="git checkout master"

alias nix-reb="sudo nixos-rebuild switch"
alias nix-up="sudo nixos-rebuild --upgrade switch"
alias nix-garb="sudo nix-collect-garbage -d"
alias nix-chan="echo System channels:&&sudo nix-channel --list && echo User channels:&&nix-channel --list"

alias gs="cd ~/dev/aspire-supply-chain"
alias gh="cd ~"
alias gt="cd ~/Templates"
alias gd="cd ~/dev"
mdc ()
{
  mkdir -p -- "$1" &&
  cd -P -- "$1"
}

template ()
{
  cp ~/Templates/"$1"/* . &&
  nix-shell
}
