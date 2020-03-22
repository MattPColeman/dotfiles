{ config, pkgs, ... }:

{
  services.xserver = {
    layout = "gb";
  };

  environment.systemPackages = with pkgs; [
    xorg.xmodmap
  ];

  environment.extraInit = ''
    xmodmap -e "keycode 108 = Left"
    xmodmap -e "keycode 62 = Up"
    xmodmap -e "keycode 134 = Down"
    xmodmap -e "keycode 105 = Right"
  '';
}
