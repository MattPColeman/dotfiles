{ options, config, lib, pkgs, ... }:

with lib;
{
  options.desktop.polybar.enable = mkEnableOption "pantheon";

  config = mkIf config.desktop.polybar.enable {
    environment.systemPackages = with pkgs; [ polybarFull ];
  };
}
