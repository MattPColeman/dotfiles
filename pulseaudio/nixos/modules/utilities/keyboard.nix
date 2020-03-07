{ config, pkgs, ... }:
{
  # video driver
  services.xserver = {
    layout = "gb";
  };

  environment.systemPackages = with pkgs; [
    xmodmap
  ];
}
