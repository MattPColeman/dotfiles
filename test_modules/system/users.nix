{ config, home-manager, lib, options, ... }:

with lib;
{

  options = {
    user = {
      modules = mkOption attrs;
    };
  };

  config = {
    security.sudo.wheelNeedsPassword = false;
    users.mutableUsers = false;
  };
}
