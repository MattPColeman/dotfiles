{ config, pkgs, ... }:
let
  xin = pkgs.stdenv.mkDerivation {
    pname = "xin";
    version = "0.0.1";
    src = ./.;

    propagatedBuildInputs = with pkgs; [
      python3
      python3Packages.click
      python3Packages.GitPython
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
