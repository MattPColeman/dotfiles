{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    materia-theme
    numix-cursor-theme
    arc-icon-theme
    theme-vertex
    paper-gtk-theme
    paper-icon-theme
  ];
}
