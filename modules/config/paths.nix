{ self, config, lib, ... }:

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
    environment.variables = {
      DOTFILES        = config.local.dotfilesDir;
      DOTFILES_BINS   = config.local.binDir;
      DOTFILES_CONFIG = config.local.configDir;
    };
    env.PATH = [ "$XDG_CONFIG_HOME/dotfiles/bin" "$PATH" ];
    
    environment.extraInit =
      builtins.concatStringsSep "\n"
        (lib.attrsets.mapAttrsToList (n: v: "export ${n}=\"${v}\"") config.env);
  };
}
