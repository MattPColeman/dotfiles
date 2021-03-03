{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
  };

  fonts = {
    enableFontDir = true;
    fonts = with pkgs; [
      hack-font
      iosevka
      font-awesome
      fira-code
    ];
  };

  time.timeZone = "Europe/London";
}
