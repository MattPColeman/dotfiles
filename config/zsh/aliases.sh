alias nix-reb="sudo nixos-rebuild switch"
alias nix-up="sudo nixos-rebuild --upgrade switch"
alias nix-garb="sudo nix-collect-garbage -d"
alias nix-chan="echo System channels:&&sudo nix-channel --list && echo User channels:&&nix-channel --list"

alias cdd="cd ~/dev"
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
