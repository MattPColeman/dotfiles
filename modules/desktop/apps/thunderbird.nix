{ options, config, lib, pkgs, ... }:

with lib;
{
  options.modules.desktop.apps.thunderbird.enable = mkEnableOption "thunderbird";
  config = mkIf config.modules.desktop.apps.thunderbird.enable {
    environment.systemPackages = [ pkgs.thunderbird ];
  };
}
