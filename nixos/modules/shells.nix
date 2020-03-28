{ config, pkgs, ... }:

{
  programs.zsh.enable = true;
  users.extraUsers.matt = {
    shell = pkgs.zsh;
  };
}
