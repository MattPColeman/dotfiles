{ config, lib, pkgs, ... }:

/* hosts/Dagon.nix
    VirtualBox "hardware" config and tweaks.
    Requires:
      * bootable disk /dev/sda
      * disk labelled "nixos"
      * disk labelled "swap""
*/

{
  boot.initrd.availableKernelModules =
    [ "ata_piix" "ohci_pci" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  boot.loader.grub.device = "/dev/sda";
  boot.initrd.checkJournalingFS = false;

  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };
  swapDevices = [{ device = "/dev/disk/by-label/swap"; }];

  virtualisation.virtualbox.guest.enable = true;

  system.stateVersion = "20.09";

  services.xserver.enable = true;
}
