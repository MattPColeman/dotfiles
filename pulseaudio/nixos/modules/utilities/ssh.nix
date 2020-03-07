{ config, pkgs, ... }:
{
  services.openssh.enable = true;
  services.openssh.passwordAuthentication = false;
  services.openssh.authorizedKeysFiles = ["/ssh/authorized_keys"];
}
