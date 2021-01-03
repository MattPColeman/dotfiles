{ options, config, lib, pkgs, ... }:

with lib;
{
  options.modules.desktop.bar.polybar.enable = mkEnableOption "pantheon";

  config = mkIf config.modules.desktop.bar.polybar.enable {
    environment.systemPackages = with pkgs; [ polybarFull ];
    home.configFile = with config.local; {
      "polybar/config".source = "${configDir}/polybar/config";
      "polybar/launch.sh".source = "${configDir}/polybar/launch.sh";
    };
  };
}
