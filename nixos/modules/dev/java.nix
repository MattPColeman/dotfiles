{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [ adoptopenjdk-openj9-bin-8 ];
}
