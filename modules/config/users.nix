{ config, home-manager, lib, options, ... }:

with config;
{
  local.username = "matt";

  users.extraUsers.${local.username} = {
    isNormalUser = true;
    home="/home/${local.username}";
    extraGroups = ["wheel" "networkmanager" "input" "audio" "docker"];
    uid = 1000;
  };

  home-manager = {
    useUserPackages = true;
    users.${local.username} = with lib; {
      home = {
        file = mkAliasDefinitions options.home.file;
        stateVersion = system.stateVersion;
      };
      xdg = {
        enable = true;
        configFile = mkAliasDefinitions options.home.configFile;
        dataFile   = mkAliasDefinitions options.home.dataFile;
      };
    };
  };
  environment.sessionVariables = {
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_CACHE_HOME  = "$HOME/.cache";
    XDG_DATA_HOME   = "$HOME/.local/share";
    XDG_BIN_HOME    = "$HOME/.local/bin";
  };
}
