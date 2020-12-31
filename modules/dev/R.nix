{ options, config, pkgs, lib, ... }:

with lib; let cfg = config.modules.dev.R; in
{
  options.modules.dev.R.enable = mkEnableOption "R";

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ R ];
  };
}
