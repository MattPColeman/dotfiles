{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
  ];
  
  environment.shellAliases = {
    vim = "nvim";
    vi  = "nvim";
    v   = "nvim";
  };
}
