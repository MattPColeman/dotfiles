{ config, pkgs, ... }:

let configDir = ../../config;
in {
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    configFile = "${configDir}/pulseaudio/config";
  };
  # Fixes stutter when audio resumes
  environment.extraInit = ''
    xset s off -dpms
  '';
}
