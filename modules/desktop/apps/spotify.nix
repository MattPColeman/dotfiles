{ options, config, lib, pkgs, ... }:

with lib;
{
  options.modules.desktop.apps.spotify.enable = mkEnableOption "spotify";
  config = mkIf config.modules.desktop.apps.spotify.enable {
    environment.systemPackages = [ pkgs.spotify ];
  };
}
