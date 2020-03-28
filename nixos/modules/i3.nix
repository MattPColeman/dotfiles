{ config, pkgs, ... }:

{
  services.xserver.windowManager.i3 = {
    enable=true;
    configFile=../../i3/config;
    package = pkgs.i3-gaps;
    extraPackages = with pkgs; [ i3status i3lock ];
  };

  services.compton = {
    enable = true;
    fade = true;
    fadeDelta = 4;
    fadeSteps = ["0.03" "0.03"];
    shadow = true;
    shadowOpacity = "0.8";
    shadowExclude = ["name ~= 'i3bar'" "window_type *= 'menu'"];
    backend = "glx";
    vSync = true;
  };

  environment.systemPackages = with pkgs; [
    feh scrot imagemagick  # xlocker
    lxappearance
    rofi
    unclutter-xfixes
  ];


  services.xserver.displayManager.lightdm = {
    enable = true;
    greeters.gtk.enable = true;
  };

}
