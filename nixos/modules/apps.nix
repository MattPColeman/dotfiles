{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xfce.thunar
    xfce.gvfs
    gvfs
    firefox
    thunderbird
    transmission-gtk
    atom
    emacs
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
