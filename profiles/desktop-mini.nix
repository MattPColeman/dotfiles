{ config, pkgs, ... }:

{
  imports =
    [
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

      ../modules/dev/git.nix
      ../modules/dev/shell.nix
      ../modules/dev/random_tools.nix
    ];
}
