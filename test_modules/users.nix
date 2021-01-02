{ config, home-manager, lib, options, ... }:

{
  config = {
    security.sudo.wheelNeedsPassword = false;
    users.mutableUsers = false;
  };
}
