{ config, pkgs, ... }:

{
  services.xserver = {
    layout = "gb";
  };

  environment.systemPackages = with pkgs; [
    xorg.xmodmap
  ];

  environment.extraInit = ''
    $DOTFILES/remap_keys.sh
  '';
}
