{ lib, ... }:

with builtins;
with lib;
rec {
  isNixFile = filename:
    hasSuffix ".nix" filename;
  listFiles = dir:
    map (x: "${toString dir}/${x}") (attrNames (filterAttrs (x: y: y == "regular") (readDir dir)));
  listFilesRec = dir:
    flatten (mapAttrsToList (n: t: if t == "regular" then "${toString dir}/${n}" else listModulesRec (toPath "/${toString dir}/${n}")) (readDir dir));
  listModules = dir:
    filter isNixFile (listFiles dir);
  listModulesRec = dir:
    filter isNixFile (listFilesRec dir);
}
