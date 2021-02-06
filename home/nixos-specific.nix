{ pkgs, lib, ... }:

let configDir = ../config;
in {
  imports = [ ./common.nix ];

  xdg = {
    enable = true;
    configFile = {
      "polybar/config".source = "${configDir}/polybar/config";
      "polybar/launch.sh".source = "${configDir}/polybar/launch.sh";
    };
  };
  home = {
    packages = with pkgs; [
      spotify
      steam
      polybarFull
      transmission-gtk
      xfce.thunar
      rxvt-unicode
      polybarFull
      parted
    ];

  };
  programs = { rofi = { enable = true; }; };
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
  xsession = {
    enable = true;
    windowManager = {
      command = "i3";
      i3 = {
        package = pkgs.i3-gaps;
        config.bars = [ ];
        extraConfig = builtins.readFile ../config/i3/config;
      };
    };
  };
}
