{ config, pkgs, ... }:

let
  xin = pkgs.stdenv.mkDerivation {
    pname = "xin";
    version = "0.0.1";
    src = ./.;

    propagatedBuildInputs = with pkgs; [
      python38
      python38Packages.click
      python38Packages.GitPython
    ];

    installPhase = ''
      mkdir -p $out/bin
      cp main.py $out/bin/xin
      chmod +x $out/bin/xin
    '';
  };
in
{
  config.environment.systemPackages = [ xin ];
}
