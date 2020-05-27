{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    retroarch
    ckan
    steam
    wine
    lutris
    nethack
    (pkgs.dwarf-fortress-packages.dwarf-fortress-full.override {
       theme = "jolly-bastion";
    })
  ];

  nixpkgs.config.retroarch = {
    enableMGBA = true;
    enableBeetlePSXHW = true;
  };
  hardware.opengl.driSupport32Bit = true;
  hardware.pulseaudio.support32Bit = true;

services.udev.extraRules = ''
  KERNEL=="hidraw*", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="09cc", MODE="0666"
'';

}
