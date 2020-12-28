{ self, lib, ... }:

{
  options = {
    local = lib.mkOption {
      type = types.attrs;
      description = "Local variables.";
    };
  };

  config = {
    local = rec {
      dotfilesDir = toString ../../.;
      binDir      = "${dotfilesDir}/bin";
      configDir   = "${dotfilesDir}/config";
      hostsDir    = "${dotfilesDir}/hosts";
      modulesDir  = "${dotfilesDir}/modules";
      profilesDir = "${dotfilesDir}/profiles";
    };
  };
}
