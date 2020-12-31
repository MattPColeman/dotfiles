{ options, config, lib, pkgs, ... }:

with lib; let cfg = config.modules.desktop.manager.compositing; in
{
  options.modules.desktop.manager.compositing.enable = mkEnableOption "compositing";

  config = mkIf cfg.enable {
    services.compton = {
      enable = true;
      fade = true;
      fadeDelta = 4;
      fadeSteps = [ 0.03 0.03 ];
      shadow = true;
      shadowOpacity = 0.8;
      shadowExclude = [ "name ~= 'i3bar'" "window_type *= 'menu'" ];
      backend = "glx";
      vSync = true;
    };
  };
}
