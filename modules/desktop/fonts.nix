{ config, pkgs, ... }:

{
  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      corefonts
      hack-font
      iosevka
      noto-fonts
      font-awesome
      envypn-font
      unifont
    ];
  };
}
