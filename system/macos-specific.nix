{ config, pkgs, ... }:
{
  imports = [ ./common.nix ];
  users.nix.configureBuildUsers = true;
  security.pki.certificateFiles = ["/Users/matt/.config/git/caadmin.netskope.com.pem"];
}
