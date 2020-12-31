{ options, config, lib, pkgs, ... }:

with lib; let cfg = config.modules.extraThemes; in
{
  options.modules.extraThemes.enable = mkEnableOption "extraThemes";
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      materia-theme
      numix-cursor-theme
      arc-icon-theme
      theme-vertex
      paper-gtk-theme
      paper-icon-theme
    ];
  };
}
