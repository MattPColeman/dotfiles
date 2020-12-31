{ options, config, lib, pkgs, ... }:

with lib; let cfg = config.modules.games.misc; in
{
  options.modules.games.misc.enable = mkEnableOption "misc";
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ wine lutris nethack ckan ];
  };
}
