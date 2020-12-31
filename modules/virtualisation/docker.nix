{ options, config, pkgs, lib, ... }:

with lib; let cfg = config.modules.virtualisation.docker; in
{
  options.modules.virtualisation.docker.enable = mkEnableOption "docker";

  config = mkIf cfg.enable {
    environment.systemPackages = [ pkgs.docker ];
    virtualisation.docker.enable = true;
    modules.shell.zsh.aliasFiles = [ "${config.local.configDir}/docker/aliases.sh" ];
  };
}
