{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [ docker ];
  virtualisation.docker.enable = true;
  environment.shellAliases = {
    dk = "docker kill";
    dps = "docker ps";
    dka = "echo Killing containers:&& docker ps -q | xargs docker kill";
  };
}
