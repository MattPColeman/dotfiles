{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    exfat   # universal fs
    ntfs3g  # windows sucks
  ];

  fileSystems."/data" =
  { device = "/dev/disk/by-uuid/3335d971-c264-4658-b012-94425b29852b";
    fsType = "ext4";
  };
}
