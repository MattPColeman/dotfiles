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
  environment.variables.CURRENT_SYSTEM_HOST = "migo";
  system.stateVersion = "20.09";
  imports = [ ./hardware/pulseaudio.nix ./hardware/ducky.nix ];

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

  # GPU
  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
  };

  # BOOT
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  environment.systemPackages = with pkgs; [ efibootmgr ];
}
