{ config, pkgs, ... }:

{
  environment.variables = {
    ATOM_HOME = "$XDG_CONFIG_HOME/atom";
  };
  environment.systemPackages = with pkgs; [ atom ];
  home.configFile = with config.local; {
    "atom" = { source = "${configDir}/atom"; recursive = true; };
  };
}
