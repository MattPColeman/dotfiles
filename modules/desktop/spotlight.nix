{ options, config, lib, pkgs, ... }:

with lib;
{
  options.modules.desktop.spotlight.rofi.enable = mkEnableOption "spotlight";
  config = mkIf config.modules.desktop.spotlight.rofi.enable { environment.systemPackages = [ pkgs.rofi ]; };
}
