{ config, home-manager, lib, options, ... }:

with lib;
{
  config = {
    security.sudo.wheelNeedsPassword = false;
    users.mutableUsers = false;
  };
}
