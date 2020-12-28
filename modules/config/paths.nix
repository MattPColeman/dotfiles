{ self, config, ... }:

{
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
