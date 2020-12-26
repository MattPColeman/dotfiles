{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (pkgs.dwarf-fortress-packages.dwarf-fortress-full.override {
       theme = "jolly-bastion";
    })
  ];
}
