{ config, pkgs, ... }:

{
  config = {
    environment.variables.CURRENT_SYSTEM_PROFILE = "desktop-full";

    modules.shell = {
      zsh.enable  = true;
      git.enable  = true;
      misc.enable = true;
    };

    modules.dev = {
      go.enable        = true;
      java.enable      = true;
      python.enable    = true;
      R.enable         = true;
      terraform.enable = true;
    };
    
    modules.virtualisation = {
      docker.enable = true;
    };
  };

  imports = [
    ../modules/themes/icons.nix

    ../modules/config/ssh.nix
    ../modules/config/users.nix
    ../modules/config/locale.nix
    ../modules/config/paths.nix
    ../modules/config/options.nix

    ../modules/desktop/i3.nix
    ../modules/desktop/compton.nix
    ../modules/desktop/apps/blender.nix
    ../modules/desktop/apps/firefox.nix
    ../modules/desktop/apps/gimp.nix
    ../modules/desktop/apps/flatpak.nix
    ../modules/desktop/apps/godot.nix
    ../modules/desktop/apps/spotify.nix
    ../modules/desktop/apps/thunar.nix
    ../modules/desktop/apps/thunderbird.nix
    ../modules/desktop/apps/torrents.nix
    ../modules/desktop/editors/emacs.nix
    ../modules/desktop/editors/vim.nix
    ../modules/desktop/editors/atom.nix
    ../modules/desktop/games/df.nix
    ../modules/desktop/games/emu.nix
    ../modules/desktop/games/ksp.nix
    ../modules/desktop/games/misc.nix
    ../modules/desktop/games/steam.nix
    ../modules/desktop/terms/urxvt.nix
    ../modules/desktop/fonts.nix
    ../modules/desktop/power-management.nix

    ../modules/tools/pentest.nix
    ../modules/tools/nix.nix
    ../modules/tools/misc.nix
    ../modules/tools/xin/default.nix

    ../modules/dev/default.nix
    ../modules/shell/default.nix
    ../modules/virtualisation/default.nix
  ];
}
