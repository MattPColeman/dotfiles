{ config, home-manager, lib, options, ... }:

with lib;
{

  options = {
    user = mkAliasDefinitions options.users.extraUsers;
  };

  config = {
    security.sudo.wheelNeedsPassword = false;
    users.mutableUsers = false;
  };
}
