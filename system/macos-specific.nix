{ config, pkgs, ... }:
{
  imports = [ ./common.nix ];
  users.nix.configureBuildUsers = true;
}
