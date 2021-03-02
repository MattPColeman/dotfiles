{ pkgs, lib, ... }:
let
  firefoxDMG = pkgs.stdenv.mkDerivation rec {
    pname = "Firefox";
    version = "84.0.2";

    buildInputs = [ pkgs.undmg ];
    sourceRoot = ".";
    phases = [ "unpackPhase" "installPhase" ];
    installPhase = ''
      mkdir -p "$out/Applications"
      cp -r Firefox.app "$out/Applications/Firefox.app"
    '';

    src = pkgs.fetchurl {
      name = "Firefox-${version}.dmg";
      url = "https://download-installer.cdn.mozilla.net/pub/firefox/releases/${version}/mac/en-GB/Firefox%20${version}.dmg";
      sha256 = "45ca188963f808297f4c6fd9119e9333aa8561a585523f57f5bcfe98e09dabb6";
    };

    meta = with pkgs.lib; {
      description = "Firefox seems to be broken on Darwin. Sad!";
      platforms = platforms.darwin;
    };
  };
in
{
  home.sessionVariables.FLAKE_BUILD = "DAGON";

  imports = [ ./common.nix ];
  programs = {
    firefox.package = firefoxDMG;
    zsh.envExtra = ''
      export PATH=/etc/profiles/per-user/$(whoami)/bin/:$PATH
      export PATH=/run/current-system/sw/bin:$PATH
      export PATH=$PATH:/Applications/Docker.app/Contents/Resources/bin
    '';
  };
}
