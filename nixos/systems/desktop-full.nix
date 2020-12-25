{ config, pkgs, ... }:

{
  imports =
    [
      ../../nixos/modules/flatpak.nix
      ../../nixos/modules/apps.nix
      ../../nixos/modules/dev-tools.nix
      ../../nixos/modules/terminal.nix
      ../../nixos/modules/fonts.nix
      ../../nixos/modules/games.nix
      ../../nixos/modules/i3.nix
      ../../nixos/modules/keyboard.nix
      ../../nixos/modules/mount.nix
      ../../nixos/modules/networking.nix
      ../../nixos/modules/power-management.nix
      ../../nixos/modules/shells.nix
      ../../nixos/modules/ssh.nix
      ../../nixos/modules/themes.nix
      ../../nixos/modules/users.nix
      ../../nixos/modules/nix.nix
      ../../nixos/modules/personal.nix
      ../../nixos/modules/efi.nix
      ../../nixos/modules/nvidia.nix
      ../../nixos/modules/pulseaudio.nix
    ];
}
