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

  nixpkgs.config.packageOverrides = pkgs:
  { lxappearance = pkgs.lxappearance.overrideAttrs(old: rec {
      name = "lxappearance-0.6.2";
      src = pkgs.fetchurl {
        url = "mirror://sourceforge/project/lxde/LXAppearance/${name}.tar.xz";
        sha256 = "07r0xbi6504zjnbpan7zrn7gi4j0kbsqqfpj8v2x94gr05p16qj4";
      };
    });
  };

}
