{ options, config, lib, pkgs, ... }:

with lib; let cfg = config.modules.desktop.manager.i3; in
{
  options.modules.desktop.manager.i3.enable = mkEnableOption "i3";
  
  config = mkIf cfg.enable {
    services.xserver.windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      extraPackages = with pkgs; [ i3status i3lock ];
    };

    environment.systemPackages = with pkgs; [
      feh
      scrot
      imagemagick # xlocker
      lxappearance
      rofi
      unclutter-xfixes
    ];

    services.xserver.desktopManager.xterm.enable = false;

    home.configFile = with config.local; {
      "i3/config".source = "${configDir}/i3/config";
      "i3status/config".source = "${configDir}/i3status/config";
    };
  };

}
