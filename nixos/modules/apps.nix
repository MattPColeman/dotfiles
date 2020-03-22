{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    xfce.thunar
    xfce.terminal
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
  ];

}
