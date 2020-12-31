{ options, config, lib, pkgs, ... }:

with lib;
{
  options.modules.desktop.apps.firefox.enable = mkEnableOption "firefox";
  config = mkIf config.modules.desktop.apps.firefox.enable {
    environment.systemPackages = [ pkgs.firefox ];
  };
}
