{ options, config, lib, pkgs, ... }:

with lib;
{
  options.modules.desktop.apps.transmission.enable = mkEnableOption "transmission";
  config = mkIf config.modules.desktop.apps.transmission.enable {
    environment.systemPackages = [ pkgs.transmission-gtk ];
  };
}
