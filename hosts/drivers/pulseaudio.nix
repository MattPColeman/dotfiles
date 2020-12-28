{ config, pkgs, ... }:

{
  sound.enable = true;
  hardware.pulseaudio={
    enable = true;
    configFile = "${configDir}/pulseaudio/config";
  };
}
