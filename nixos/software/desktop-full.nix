{ config, pkgs, ... }:

{
  imports =
    [
      ../../nixos/software/modules/flatpak.nix
      ../../nixos/software/modules/fonts.nix
      ../../nixos/software/modules/power-management.nix
      ../../nixos/software/modules/ssh.nix
      ../../nixos/software/modules/themes.nix
      ../../nixos/software/modules/users.nix
      ../../nixos/software/modules/nix.nix
      ../../nixos/software/modules/personal.nix

      ../../nixos/software/modules/desktop/i3.nix
      ../../nixos/software/modules/desktop/apps/blender.nix
      ../../nixos/software/modules/desktop/apps/firefox.nix
      ../../nixos/software/modules/desktop/apps/gimp.nix
      ../../nixos/software/modules/desktop/apps/godot.nix
      ../../nixos/software/modules/desktop/apps/misc.nix
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
