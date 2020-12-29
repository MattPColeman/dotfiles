{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ retroarch ];

  nixpkgs.config.retroarch = {
    enableMGBA = true;
    enableBeetlePSXHW = true;
  };
}
