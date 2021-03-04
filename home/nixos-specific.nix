{ pkgs, lib, ... }:
{
  imports = [ ./common.nix ];
  home.packages = with pkgs; [
    polybarFull
    transmission-gtk
    polybarFull
    feh
    docker
    docker-compose
    steam
  ];

  gtk.enable = true;
  programs.rofi.enable = true;
  services = {
    picom = {
      enable = true;
      fade = true;
      fadeDelta = 4;
      fadeSteps = [ "0.03" "0.03" ];
      shadow = true;
      shadowOpacity = "0.8";
      shadowExclude = [ "name ~= 'i3bar'" "window_type *= 'menu'" ];
      vSync = true;
    };
  };
}
