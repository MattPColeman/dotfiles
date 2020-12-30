{ options, config, lib, ... }:

with builtins; with lib;
let
  path = dir: f: "${toString dir}/${f}";
  isNixSubmodule = f:
    f != "default.nix" &&
    substring 0 1 f != "_" &&
    substring (stringLength f - 4) (stringLength f) f == ".nix";
  submodulesInDir = dir: path dir (filter isNixSubmodule (attrNames (readDir dir)));
in
{
  imports = [(submodulesInDir ./.)];
}
