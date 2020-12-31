{ options, config, lib, pkgs, ... }:

with lib;
{
  options.modules.desktop.apps.atom.enable = mkEnableOption "atom";

  config = mkIf config.modules.desktop.apps.atom.enable {
    environment.variables = { ATOM_HOME = "$XDG_CONFIG_HOME/atom"; };
    environment.systemPackages = [ pkgs.atom ];
    home.configFile = with config.local; {
      "atom" = {
        source = "${configDir}/atom";
        recursive = true;
      };
    };
  };
}
