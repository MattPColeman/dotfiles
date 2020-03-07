{ config, pkgs, ... }:

{
  # Bash aliases
  programs.bash.shellAliases = {
    ls="ls --color=auto";
    l="ls";
    ll="ls -Al";
    la="ls -A";

    #..="cd .."
    #...="cd ../.."
    #....="cd ../../.."

    dt="cd ~/Desktop ; clear ; pwd ; ls";
    dl="cd ~/Downloads ; clear ; pwd ; ls";
    gh="cd ~/Git ; clear ; pwd ; ls";
    qm="cd ~/Dropbox/QMUL ; clear ; pwd ; ls";
    cf="cd /etc/nixos/ ; clear ; pwd ; ls";

    treee="tree -a -I '.git'";

    gst="git status";
    gc="git commit";
    gd="git diff";
    gcm = "git checkout master";

    nix-reb="sudo nixos-rebuild switch";
  };

  environment.variables = { DOTFILES="/home/matt/.files"; };

  environment.systemPackages = with pkgs; [
    zsh
    oh-my-zsh
  ];

  programs.zsh.interactiveShellInit = ''
    export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh/

    # Customize your oh-my-zsh options here
    ZSH_THEME="agnoster"
    plugins=(git)

    source $ZSH/oh-my-zsh.sh
  '';

  programs.zsh.promptInit = ""; # Clear this to avoid a conflict with oh-my-zsh

}
