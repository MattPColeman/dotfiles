{ config, pkgs, ... }:

{
  services.xserver = {
    layout = "gb";
  };

  /* environment.systemPackages = with pkgs; [
    xmodmap
  ]; */
}
