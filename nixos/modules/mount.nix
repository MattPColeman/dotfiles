{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    exfat
    ntfs3g
    efibootmgr
  ];

  fileSystems."/data" =
  { device = "/dev/disk/by-uuid/3335d971-c264-4658-b012-94425b29852b";
    fsType = "ext4";
  };

  fileSystems."/boot" =
  { device = "/dev/disk/by-label/EFI";
    fsType = "vfat";
  };
}
