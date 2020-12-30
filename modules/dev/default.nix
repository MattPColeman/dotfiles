{ options, config, ... }:

let
  subModules = dir:
    mapFilterAttrs
      (n: v: v != null && !(hasPrefix "_" n))
      (n: v:
        let path = "${toString dir}/${n}"; in
        if v == "regular" && n != "default.nix" && hasSuffix ".nix" n
          then nameValuePair (removeSuffix ".nix" n) (path)
        else nameValuePair "" null)
      (readDir dir);
in { imports = [ (subModules ./). ]; }
