{ options, config, lib, pkgs, ... }:

with lib; let cfg = config.modules.games.emulation; in
{
  options.modules.games.emulation.enable = mkEnableOption "emulation";

  config = mkIf cfg.enable {
    environment.systemPackages = [ pkgs.retroarch ];

    nixpkgs.config.retroarch = {
      enableMGBA = true;
      enableBeetlePSXHW = true;
    };
  };
}
