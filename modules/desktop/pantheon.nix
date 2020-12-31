{ options, config, lib, pkgs, ... }:

with lib;
{
  options.desktop.pantheon.enable = mkEnableOption "pantheon";

  config = mkIf config.desktop.pantheon.enable {
    services.xserver.desktopManager.pantheon.enable = true;
  };
}
