{ config, pkgs, ... }:

{
  # EFI / systemd boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # audio driver
  sound.enable = true;
  hardware.pulseaudio={
    enable = true;
    configFile = ../../../pulseaudio/config;
  };

  # video driver
  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidiaBeta" ];
    desktopManager.xterm.enable = false;
  };

  # locale settings
  time.timeZone = "Europe/London";
  console.font = "Lat2-Terminus16";
  console.keyMap = "uk";
  i18n = {
    defaultLocale = "en_US.UTF-8";
  };

  services.xserver.autoRepeatDelay = 350;
  services.xserver.autoRepeatInterval = 22;

  # imports
  imports =
    [
      ./hardware-configuration.nix

      ../../modules/software/apps.nix     # system packages
      ../../modules/software/gaming.nix
      ../../modules/software/lightdm_greeter.nix
      ../../modules/software/i3.nix

      ../../modules/utilities/alias.nix   # Bash aliases
      ../../modules/utilities/ssh.nix     # ssh settings
      ../../modules/utilities/users.nix   # define users
      ../../modules/utilities/wifi.nix    # home network
      ../../modules/utilities/mounting.nix

    ];

  # don't change - used to reconcile
  # with nix version, not to upgrade!
  system.stateVersion = "17.09";

}
