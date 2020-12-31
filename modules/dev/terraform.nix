{ options, config, pkgs, lib, ... }:

with lib; let cfg = config.modules.dev.terraform; in
{
  options.modules.dev.terraform.enable = mkEnableOption "terraform";

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ terraform ];
  };
}
