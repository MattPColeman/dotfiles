{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    python27Full
    python37Full
    python38Full
    python39Full
  ];
  modules.shell.zsh.aliasFiles = [ "${config.local.configDir}/python/aliases.sh" ];
}
