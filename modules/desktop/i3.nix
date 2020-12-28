{ config, pkgs, ... }:

with config.local;
{
  services.xserver.windowManager.i3 = {
    enable=true;
    configFile="${configDir}/i3/config";
    package = pkgs.i3-gaps;
    extraPackages = with pkgs; [ i3status i3lock ];
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

  services.xserver.desktopManager.xterm.enable = false;

}
