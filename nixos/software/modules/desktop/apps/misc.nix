{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    usbutils
    unar
    filezilla
  ];

  networking.networkmanager.enable = true;
}
