{ config, options, lib, home-manager, ... }:

with lib;
{
  options = with types; {
    local = mkOption {
      type = attrs;
      description = "Local variables.";
    };
  };
}
