{ config, pkgs, ... }:

{
  system.stateVersion = "17.09";
  time.timeZone = "Europe/London";
  console.font = "Lat2-Terminus16";
  services.xserver.autoRepeatDelay = 350;
  services.xserver.autoRepeatInterval = 22;
}
