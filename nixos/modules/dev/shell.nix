{ config, pkgs, ... }:

{
  programs.zsh.enable = true;
  users.extraUsers.matt = {
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    tree
    ranger
    wget
    parted
    gnumake
  ];
  
  environment.shellAliases = {
    ls    = "ls --color=auto";
    l     = "ls --color=auto";
    ll    = "ls -Al";
    la    = "ls -A";
    c     = "clear";
    treee = "tree -a -I '.git'";
  };
}
