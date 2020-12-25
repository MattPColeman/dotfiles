{ config, pkgs, ... }:

{
  imports =
    [
      ../../nixos/modules/flatpak.nix
      ../../nixos/modules/apps.nix
      ../../nixos/modules/terminal.nix
      ../../nixos/modules/fonts.nix
      ../../nixos/modules/games.nix
      ../../nixos/modules/i3.nix
      ../../nixos/modules/power-management.nix
      ../../nixos/modules/ssh.nix
      ../../nixos/modules/themes.nix
      ../../nixos/modules/users.nix
      ../../nixos/modules/nix.nix
      ../../nixos/modules/personal.nix
      ../../nixos/modules/efi.nix

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
