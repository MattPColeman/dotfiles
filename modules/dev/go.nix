{ options, config, pkgs, lib, ... }:

with lib; let cfg = config.modules.dev.go; in
{
  options.modules.dev.go.enable = mkEnableOption "go";

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ go ];
  };
}
