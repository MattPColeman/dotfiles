{ config, lib, pkgs, ... }:

/* ../hosts/MiGo.nix

    Desktop with:
      i5 3570k
      gtx 970
      3440x1440 monitor

    Assumes:
      * disk labelled "NIXOS", mounted at /
      * disk labelled "DATA",  mounted at /data
      * disk labelled "EFI"",  mounted at /boot

    Specific tweaks for hardware:
      * Key remapping (ducky mini)
      * Pulseaudio conf allows HDMI / line-out simultaneously
*/

{
  system.stateVersion = "20.09";

  # KERNEL
  boot.initrd.availableKernelModules =
    [ "xhci_pci" "ehci_pci" "ahci" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  # FILESYSTEM
  fileSystems."/" = {
    device = "/dev/disk/by-label/NIXOS";
    fsType = "ext4";
  };

  fileSystems."/data" = {
    device = "/dev/disk/by-label/DATA";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/EFI";
    fsType = "vfat";
  };

  swapDevices = [ ]; # Should probably have some swap...

  # CPU
  nix.maxJobs = lib.mkDefault 4;
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";

  # BOOT
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  environment.systemPackages = with pkgs; [
    efibootmgr
    xorg.xmodmap
  ];

  # GPU
  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
  };

  # AUDIO
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    configFile = ../config/pulseaudio/config;
  };

  # HARDWARE TWEAKS
  environment.extraInit = ''
    # Remap keys for Ducky mini. Dipswitches for the below are:
    #  1 ON
    #  2 OFF
    #  3 OFF
    #  4 OFF

    xmodmap -e "clear shift"
    xmodmap -e "add shift = Shift_L"
    xmodmap -e "keycode 62 = Up"

    xmodmap -e "clear ctrl"
    xmodmap -e "add ctrl = Control_L"
    xmodmap -e "keycode 105 = Right"

    xmodmap -e "keycode 108 = Left"

    xmodmap -e "clear mod4"
    xmodmap -e "add mod4 = Super_L"
    xmodmap -e "keycode 134 = Down"

    # fix stutter when resuming audio
    xset s off -dpms
  '';

}
