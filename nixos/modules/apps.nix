{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xfce.thunar
    xfce.gvfs
    gvfs
    firefox
    transmission-gtk
    atom
    spotify
    usbutils
    unar
    filezilla
    ncdu
    gimp
    godot
    blender
    neofetch
  ];
}
