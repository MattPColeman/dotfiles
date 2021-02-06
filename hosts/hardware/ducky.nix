{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ xorg.xmodmap ];

  # For the following keycodes, dipswitches are:
  #  1 ON
  #  2 OFF
  #  3 OFF
  #  4 OFF

  environment.extraInit = ''
    xmodmap -e "clear shift"
    xmodmap -e "add shift = Shift_L"
    xmodmap -e "keycode 62 = Up"

    xmodmap -e "clear ctrl"
    xmodmap -e "add ctrl = Control_L"
    xmodmap -e "keycode 105 = Right"

    xmodmap -e "keycode 108 = Left"

    xmodmap -e "clear mod4"
    xmodmap -e "add mod4 = Super_L"
    xmodmap -e "keycode 134 = Down"

  '';

  console.keyMap = "uk";
  i18n = { defaultLocale = "en_US.UTF-8"; };
  services.xserver = { layout = "gb"; };
}
