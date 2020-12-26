{ config, pkgs, ... }:

{
  services.compton = {
    enable = true;
    fade = true;
    fadeDelta = 4;
    fadeSteps = [0.03 0.03];
    shadow = true;
    shadowOpacity = 0.8;
    shadowExclude = ["name ~= 'i3bar'" "window_type *= 'menu'"];
    backend = "glx";
    vSync = true;
  };
}
