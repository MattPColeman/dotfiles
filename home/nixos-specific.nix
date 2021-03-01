{ pkgs, lib, ... }:

let
  configDir = ../config;
in {
  home.sessionVariables.FLAKE_BUILD = "MIGO";

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

  gtk = {
    enable = true;
    theme = {
      package = pkgs.dracula-theme;
      name = "Dracula";
    };
    iconTheme = {
      package = pkgs.paper-icon-theme;
      name = "Paper";
    };
  };
  programs.rofi = {
    enable = true;
    theme = ../config/rofi/dracula.rasi;
  };
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
