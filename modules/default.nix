{ options, config, lib, ... }:

with builtins;
with lib;
let
  listModulesRec = dir:
    filter (f: hasSuffix ".nix" f) (flatten (mapAttrsToList (n: t: if t == "regular" then "${toString dir}/${n}" else listModulesRec (toPath "/${toString dir}/${n}")) (readDir dir)));
in
{
  imports = filter (mod: baseNameOf mod != "default.nix") (listModulesRec ./.);
}
