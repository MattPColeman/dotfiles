{ options, config, lib, ... }:

with builtins; with lib;
let
  isNixSubmodule = f:
    f != "default.nix" &&
    substring 0 1 f != "_" &&
    substring (stringLength f - 4) (stringLength f) f != ".nix";
  submodulesInDir = dir: filter isNixSubmodule (attrNames (readDir dir));
in
{
  imports = [ submodulesInDir ./. ];
}
