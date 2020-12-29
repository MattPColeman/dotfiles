{ self, config, ... }:

with config; {
  local = rec {
    dotfilesDir = toString ../../.;
    binDir = "${dotfilesDir}/bin";
    configDir = "${dotfilesDir}/config";
    hostsDir = "${dotfilesDir}/hosts";
    modulesDir = "${dotfilesDir}/modules";
    profilesDir = "${dotfilesDir}/profiles";
  };
  environment.variables = with local; {
    DOTFILES = dotfilesDir;
    DOTFILES_BINS = binDir;
    DOTFILES_CONFIG = configDir;
  };
}
