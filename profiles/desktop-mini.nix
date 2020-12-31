{ config, pkgs, ... }:

{
  /*
      WIP - for (slightly) weaker machines.
  */
  config = {
    environment.variables.CURRENT_SYSTEM_PROFILE = "desktop-mini";

        modules.shell = {
          zsh.enable = true;
          git.enable = true;
          vim.enable = true;
        };

        modules.desktop = {
          greeter.lightdm.enable = true;
          manager = {
            i3.enable = true;
          };
          spotlight.rofi.enable = true;
          apps = {
            firefox.enable = true;
            atom.enable = true;
          };
        };

      };

      imports = [
        ../modules/config/ssh.nix
        ../modules/config/users.nix
        ../modules/config/locale.nix
        ../modules/config/paths.nix
        ../modules/config/options.nix

        ../modules/desktop/i3.nix
        ../modules/desktop/apps/firefox.nix
        ../modules/desktop/apps/thunar.nix
        ../modules/desktop/editors/emacs.nix
        ../modules/desktop/editors/vim.nix
        ../modules/desktop/terms/urxvt.nix
        ../modules/desktop/fonts.nix
        ../modules/desktop/power-management.nix

        ../modules/tools/nix.nix
        ../modules/tools/misc.nix
        ../modules/tools/xin/default.nix
      ];
    }
