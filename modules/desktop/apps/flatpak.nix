{ options, config, lib, pkgs, ... }:

with lib;
{
  options.modules.desktop.apps.flatpak.enable = mkEnableOption "flatpak";
  config = mkIf config.modules.desktop.apps.flatpak.enable {
    services.flatpak.enable = true;
    xdg.portal.enable = true;
  };
}
