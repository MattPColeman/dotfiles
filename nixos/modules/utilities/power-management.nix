{ config, pkgs, ... }:

{
  environment.extraInit = ''
    xset s off -dpms
  '';
}
