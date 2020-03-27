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

  services.xserver.autoRepeatDelay = 350;
  services.xserver.autoRepeatInterval = 22;

  i18n.consoleKeyMap = "uk";
  i18n = {
    defaultLocale = "en_US.UTF-8";
  };
}
