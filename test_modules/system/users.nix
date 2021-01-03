{ config, home-manager, lib, options, ... }:

with lib;
{

  options = {
    user = {
      modules = mkOption { type = types.attrs; };
    };
  };

  config = {
    security.sudo.wheelNeedsPassword = false;
    users.mutableUsers = false;
  };
}
