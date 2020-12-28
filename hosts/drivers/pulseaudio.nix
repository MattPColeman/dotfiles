{ config, pkgs, ... }:

with config.local;
{
  sound.enable = true;
  hardware.pulseaudio={
    enable = true;
    configFile = "${configDir}/pulseaudio/config";
  };
}
