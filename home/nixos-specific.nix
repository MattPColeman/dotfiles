{ pkgs, lib, ... }:

let
  configDir = ../config;
in {
  imports = [ ./common.nix ];

  xdg.configFile = {
    "i3/config".source = "${configDir}/i3/config";
    "polybar/config".source = "${configDir}/polybar/config";
  };
  home.packages = with pkgs; [
      spotify
      steam
      polybarFull
      transmission-gtk
      xfce.thunar
      rxvt-unicode
      polybarFull
      feh
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
  xresources.extraConfig = builtins.readFile ../config/xresources/dracula;
}
