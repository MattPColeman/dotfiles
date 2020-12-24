{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  # EFI / systemd boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # audio driver
  sound.enable = true;
  hardware.pulseaudio={
    enable = true;
    configFile = ../../pulseaudio/config;
  };

  # video driver
  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
    desktopManager.xterm.enable = false;
  };

  # Misc
  time.timeZone = "Europe/London";
  console.font = "Lat2-Terminus16";

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
    ];

  system.stateVersion = "17.09";

   nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
   };

}
