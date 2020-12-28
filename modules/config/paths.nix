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

  config = {
    local = rec {
      dotfilesDir = toString ../../.;
      configDir   = "${dotfilesDir}/config";
    };
  };
}
