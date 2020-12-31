{ options, config, lib, pkgs, ... }:

with lib;
{
  options.modules.desktop.apps.gimp.enable = mkEnableOption "gimp";
  config = mkIf config.modules.desktop.apps.gimp.enable {
    environment.systemPackages = [ pkgs.gimp ];
  };
}
