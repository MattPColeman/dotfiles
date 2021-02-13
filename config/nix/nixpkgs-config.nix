{ config, pkgs, ... }: 

{
  nixpkgs.config.allowUnfree = true;
  nix.package = pkgs.nixFlakes;
}
