{ lib, ... }:

with builtins;
with lib;
rec {
  pathify = dir: filename: "${toString dir}/${filename}";
  nixfilesInDir = d:
    map (pathify d) (attrNames (filterAttrs (n: t: t == "regular" && hasSuffix ".nix" n) (readDir d)));
}
