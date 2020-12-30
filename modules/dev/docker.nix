{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [ docker ];
  virtualisation.docker.enable = true;
  modules.shell.zsh.aliasFiles = [ "${config.local.configDir}/docker/aliases.zsh" ];
}
