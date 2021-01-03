{ options, config, lib, pkgs, ... }:

with lib; let cfg = config.modules.desktop.manager.gnome; in
{
  options.modules.desktop.manager.gnome.enable = mkEnableOption "gnome";
  
  config = mkIf cfg.enable {
    services.xserver.desktopManager.gnome3.enable = true;
    environment.systemPackages = [ pkgs.gnome3.gnome-tweak-tool ];
  };
}
