{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.modules.games.steam; in
{
  options.modules.games.steam.enable = mkEnableOption "steam";

  config = mkIf cfg.enable {
    environment.systemPackages = [ pkgs.steam ];

    hardware.opengl.driSupport32Bit = true;
    hardware.pulseaudio.support32Bit = true;

    # I can't remember what this does, but it's probably useful.
    services.udev.extraRules = ''
      KERNEL=="hidraw*", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="09cc", MODE="0666"
    '';
  };
}
