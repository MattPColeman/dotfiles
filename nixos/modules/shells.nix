{ config, pkgs, ... }:

{
  users.extraUsers.matt = {
    shell = pkgs.zsh;
  };
}
