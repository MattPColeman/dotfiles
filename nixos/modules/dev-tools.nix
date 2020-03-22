{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    tree
    ranger
    wget
    parted
    gnumake
    R
    python3
    python36Packages.black
    docker
    go
    terraform
  ];

  virtualisation.docker.enable = true;
}
