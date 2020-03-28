{ config, pkgs, ... }:

{
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
    videoDrivers = [ "nvidiaBeta" ];
    desktopManager.xterm.enable = false;
  };

  # Misc
  time.timeZone = "Europe/London";
  i18n.consoleFont = "Lat2-Terminus16";

  imports =
    [
      ./MiGo-hardware.nix
      ../../nixos/modules/apps.nix
      ../../nixos/modules/dev-tools.nix
      ../../nixos/modules/fonts.nix
      ../../nixos/modules/games.nix
      ../../nixos/modules/i3.nix
      /* ../../nixos/modules/pantheon.nix */
      ../../nixos/modules/keyboard.nix
      ../../nixos/modules/mount.nix
      ../../nixos/modules/networking.nix
      ../../nixos/modules/power-management.nix
      ../../nixos/modules/shells.nix
      ../../nixos/modules/ssh.nix
      ../../nixos/modules/themes.nix
      ../../nixos/modules/users.nix
      ../../nixos/modules/polybar.nix
    ];

  system.stateVersion = "17.09";

}
