{ options, config, lib, pkgs, ... }:

with lib; let cfg = config.system.greeter; in
{
  options.system.greeter.lightdm.enable = mkEnableOption "lightdm";
  config = mkIf cfg.lightdm.enable {
    services.xserver.displayManager.lightdm = {
      enable = true;
      greeters.gtk.enable = true;
    };
  };
}
