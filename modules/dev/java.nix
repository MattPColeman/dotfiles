{ options, config, pkgs, lib, ... }:

with lib; let cfg = config.modules.dev.java; in
{
  options.modules.dev.java.enable = mkEnableOption "java";

  config = mkIf cfg.enable {
    environment.systemPackages = [ pkgs.adoptopenjdk-openj9-bin-8 ];
  };
}
