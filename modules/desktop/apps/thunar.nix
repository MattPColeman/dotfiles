{ options, config, lib, pkgs, ... }:

with lib;
{
  options.modules.desktop.apps.thunar.enable = mkEnableOption "thunar";
  config = mkIf config.modules.desktop.apps.thunar.enable {
    environment.systemPackages = with pkgs; [ xfce.thunar xfce.gvfs gvfs ];
  };
}
