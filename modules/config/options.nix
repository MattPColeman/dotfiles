{ config, options, lib, home-manager, ... }:

with lib; {
  options = with types; {
    local = mkOption { type = attrs; };
    home = {
      file = mkOption { type = attrs; };
      configFile = mkOption { type = attrs; };
      dataFile = mkOption { type = attrs; };
    };
    env = mkOption {
      type = attrsOf (oneOf [ str path (listOf (either str path)) ]);
      apply = mapAttrs
        (
          n: v: if isList v
          then concatMapStringsSep ":" (x: toString x) v
          else (toString v)
        );
      default = {};
      description = "Copied wholesale from @hlissner, cheers.";
    };
  };
}
