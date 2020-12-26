{ config, pkgs, ... }:

{
  sound.enable = true;
  hardware.pulseaudio={
    enable = true;
    configFile = ../../config/pulseaudio/config;
  };
}
