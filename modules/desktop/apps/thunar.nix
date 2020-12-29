{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ xfce.thunar xfce.gvfs gvfs ];
}
