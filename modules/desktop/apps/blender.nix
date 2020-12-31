{ options, config, lib, pkgs, ... }:

with lib;
{
  options.modules.desktop.apps.blender.enable = mkEnableOption "blender";
  config = mkIf config.modules.desktop.apps.blender.enable {
    environment.systemPackages = [ pkgs.blender ];
  };
}
