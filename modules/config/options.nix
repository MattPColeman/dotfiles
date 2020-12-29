{ config, options, lib, home-manager, ... }:

with lib;
{
  options = with types; {
    local = mkOption {
      type = attrs;
      description = "Local variables.";
    };
    home = {
      file       = mkOption { type = attrs; };
      configFile = mkOption { type = attrs; };
      dataFile   = mkOption { type = attrs; };
    };
  };
}
