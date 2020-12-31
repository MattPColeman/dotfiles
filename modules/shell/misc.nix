{ options, config, lib, pkgs, ... }:

with lib; let cfg = config.modules.shell.misc; in
{
  options.modules.shell.misc.enable = mkEnableOption "misc";

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      tree
      ranger
      wget
      parted
      gnumake
      neofetch
      ncdu
    ];
  };
}
