{ config, pkgs, ... }:

{
  services.xserver.displayManager.lightdm = {
    enable = true;
    greeters.gtk.enable = true;
  };
}
