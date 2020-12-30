{ options, config, lib, ... }:

let
  mapFilterAttrs = pred: f: attrs: lib.filterAttrs pred (lib.mapAttrs' f attrs);
in
let
  modulesInDir = dir:
    mapFilterAttrs
      (n: v: v != null && !(hasPrefix "_" n))
      (n: v:
        let path = "${toString dir}/${n}"; in
        if v == "regular" && n != "default.nix" && hasSuffix ".nix" n
          then nameValuePair (removeSuffix ".nix" n) (path)
        else nameValuePair "" null)
      (readDir dir);
in
{
  imports = [ subModules ./. ];
}
