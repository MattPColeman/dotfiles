# Common aliases go here

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

template ()
{
  cp ~/Templates/"$1"/* . &&
  nix-shell
}

source $ZDOTDIR/extra_aliases.sh
