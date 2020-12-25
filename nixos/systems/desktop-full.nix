{ config, pkgs, ... }:

{
  imports =
    [
      ../../nixos/modules/flatpak.nix
      ../../nixos/modules/fonts.nix
      ../../nixos/modules/power-management.nix
      ../../nixos/modules/ssh.nix
      ../../nixos/modules/themes.nix
      ../../nixos/modules/users.nix
      ../../nixos/modules/nix.nix
      ../../nixos/modules/personal.nix
      ../../nixos/modules/efi.nix

      ../../nixos/modules/desktop/i3.nix
      ../../nixos/modules/desktop/apps/blender.nix
      ../../nixos/modules/desktop/apps/firefox.nix
      ../../nixos/modules/desktop/apps/gimp.nix
      ../../nixos/modules/desktop/apps/godot.nix
      ../../nixos/modules/desktop/apps/misc.nix
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

      ../../nixos/modules/hardware/keyboard.nix
      ../../nixos/modules/hardware/mount.nix
      ../../nixos/modules/hardware/networking.nix
      ../../nixos/modules/hardware/nvidia.nix
      ../../nixos/modules/hardware/pulseaudio.nix

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
