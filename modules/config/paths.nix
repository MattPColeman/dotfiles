{ self, lib, ... }:

with lib;
with types;
{
  options = {
    local = mkOption {
      type = attrs;
      description = "Local variables.";
    };
  };

  config = rec {
    local = {
      dotfilesDir = toString ../../.;
      configDir   = "${dotfilesDir}/config";
    };
  };
}
