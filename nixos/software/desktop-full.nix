{ config, pkgs, ... }:

{
  imports =
    [
      ../../nixos/software/modules/themes/icons.nix

      ../../nixos/software/modules/config/ssh.nix
      ../../nixos/software/modules/config/users.nix
      ../../nixos/software/modules/config/locale.nix

      ../../nixos/software/modules/desktop/i3.nix
      ../../nixos/software/modules/desktop/apps/blender.nix
      ../../nixos/software/modules/desktop/apps/firefox.nix
      ../../nixos/software/modules/desktop/apps/gimp.nix
      ../../nixos/software/modules/desktop/apps/flatpak.nix
      ../../nixos/software/modules/desktop/apps/godot.nix
      ../../nixos/software/modules/desktop/apps/spotify.nix
      ../../nixos/software/modules/desktop/apps/thunar.nix
      ../../nixos/software/modules/desktop/apps/thunderbird.nix
      ../../nixos/software/modules/desktop/apps/torrents.nix
      ../../nixos/software/modules/desktop/editors/emacs.nix
      ../../nixos/software/modules/desktop/editors/vim.nix
      ../../nixos/software/modules/desktop/editors/atom.nix
      ../../nixos/software/modules/desktop/games/df.nix
      ../../nixos/software/modules/desktop/games/emu.nix
      ../../nixos/software/modules/desktop/games/ksp.nix
      ../../nixos/software/modules/desktop/games/misc.nix
      ../../nixos/software/modules/desktop/games/steam.nix
      ../../nixos/software/modules/desktop/terms/urxvt.nix
      ../../nixos/software/modules/desktop/fonts.nix
      ../../nixos/software/modules/desktop/power-management.nix

      ../../nixos/software/modules/tools/pentest.nix
      ../../nixos/software/modules/tools/nix.nix
      ../../nixos/software/modules/tools/misc.nix

      ../../nixos/software/modules/dev/docker.nix
      ../../nixos/software/modules/dev/git.nix
      ../../nixos/software/modules/dev/go.nix
      ../../nixos/software/modules/dev/java.nix
      ../../nixos/software/modules/dev/python.nix
      ../../nixos/software/modules/dev/R.nix
      ../../nixos/software/modules/dev/shell.nix
      ../../nixos/software/modules/dev/terraform.nix
    ];
}
