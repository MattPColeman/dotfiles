{ options, config, lib, pkgs, ... }:

with lib; let cfg = config.modules.desktop.greeter; in
{
  options = {
    modules.desktop.greeter.lightdm.enable = mkEnableOption "lightdm";
    modules.desktop.greeter.gdm.enable = mkEnableOption "gdm";
  };
  
  config = {
    services.xserver = {
      desktopManager.xterm.enable = false;
      displayManager = {
        lightdm = mkIf cfg.lightdm.enable {
          enable = true;
          greeters.gtk.enable = true;
        };
        gdm = mkIf cfg.gdm.enable {
          enable = true;
        };
      };
    };
  };
}
