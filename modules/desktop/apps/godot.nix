{ options, config, lib, pkgs, ... }:

with lib;
{
  options.modules.desktop.apps.godot.enable = mkEnableOption "godot";
  config = mkIf config.modules.desktop.apps.godot.enable {
    environment.systemPackages = [ pkgs.godot ];
  };
}
