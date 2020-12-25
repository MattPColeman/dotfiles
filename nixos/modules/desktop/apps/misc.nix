{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    transmission-gtk
    usbutils
    unar
    filezilla
  ];
}
