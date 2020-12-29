{ config, pkgs, ... }:

{
  users.users.${config.local.username}.packages = with pkgs; [
    tree
    ranger
    wget
    parted
    gnumake
    neofetch
    ncdu
  ];

  environment.shellAliases = { treee = "tree -a -I '.git'"; };
}
