{ config, pkgs, ... }:

{
  services.openssh = {
    enable = true;
    passwordAuthentication = false;
    authorizedKeysFiles = ["/ssh/authorized_keys"];
  };
}
