{ config, pkgs, lib, ... }:

{
  environment.systemPackages = [ pkgs.git ];
  home.configFile."git/config".source = "${config.local.configDir}/git/config";
  modules.shell.zsh.aliasFiles = [ "${config.local.configDir}/git/aliases.zsh" ];
}
