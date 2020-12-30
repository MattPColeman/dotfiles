{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [ git ];
  home.configFile = with config.local; {
    "git/config".source = "${configDir}/git/config";
  };
}
