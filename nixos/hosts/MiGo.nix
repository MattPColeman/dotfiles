{ config, lib, pkgs, ... }:

{
  /* This is impure, which makes the flake sad. I don't know the consequences of ignoring it. */
  /* imports = [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix> ]; */

  boot.initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/f2bef369-3ae9-49e7-abba-82a1aec3a5a2";
      fsType = "ext4";
    };

  swapDevices = [ ];

  nix.maxJobs = lib.mkDefault 4;
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";

  imports =
    [
      ./drivers/nvidia.nix
      ./drivers/pulseaudio.nix
      ./interfaces/ducky.nix
      ./interfaces/efi.nix
      ./interfaces/volumes.nix
    ];
}
