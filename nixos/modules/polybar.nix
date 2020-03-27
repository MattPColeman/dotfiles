{ config, pkgs, ... }:

{
  fonts = {
    fonts = with pkgs; [
      noto-fonts
      font-awesome
      envypn-font
      unifont
    ];
  };

  environment.systemPackages = with pkgs; [
    polybarFull
  ];
}
