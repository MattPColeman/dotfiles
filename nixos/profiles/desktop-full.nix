{ config, pkgs, ... }:

{
  imports =
    [
      ../../nixos/modules/themes/icons.nix

      ../../nixos/modules/config/ssh.nix
      ../../nixos/modules/config/users.nix
      ../../nixos/modules/config/locale.nix

      ../../nixos/modules/desktop/i3.nix
      ../../nixos/modules/desktop/apps/blender.nix
      ../../nixos/modules/desktop/apps/firefox.nix
      ../../nixos/modules/desktop/apps/gimp.nix
      ../../nixos/modules/desktop/apps/flatpak.nix
      ../../nixos/modules/desktop/apps/godot.nix
      ../../nixos/modules/desktop/apps/spotify.nix
      ../../nixos/modules/desktop/apps/thunar.nix
      ../../nixos/modules/desktop/apps/thunderbird.nix
      ../../nixos/modules/desktop/apps/torrents.nix
      ../../nixos/modules/desktop/editors/emacs.nix
      ../../nixos/modules/desktop/editors/vim.nix
      ../../nixos/modules/desktop/editors/atom.nix
      ../../nixos/modules/desktop/games/df.nix
      ../../nixos/modules/desktop/games/emu.nix
      ../../nixos/modules/desktop/games/ksp.nix
      ../../nixos/modules/desktop/games/misc.nix
      ../../nixos/modules/desktop/games/steam.nix
      ../../nixos/modules/desktop/terms/urxvt.nix
      ../../nixos/modules/desktop/fonts.nix
      ../../nixos/modules/desktop/power-management.nix

      ../../nixos/modules/tools/pentest.nix
      ../../nixos/modules/tools/nix.nix
      ../../nixos/modules/tools/misc.nix

      ../../nixos/modules/dev/docker.nix
      ../../nixos/modules/dev/git.nix
      ../../nixos/modules/dev/go.nix
      ../../nixos/modules/dev/java.nix
      ../../nixos/modules/dev/python.nix
      ../../nixos/modules/dev/R.nix
      ../../nixos/modules/dev/shell.nix
      ../../nixos/modules/dev/terraform.nix
    ];
}
