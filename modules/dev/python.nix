{ options, config, pkgs, lib, ... }:

with lib; let cfg = config.modules.dev.python; in
{
  options.modules.dev.python.enable = mkEnableOption "python";

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      python27Full
      python37Full
      python38Full
      python39Full
    ];
    modules.shell.zsh.aliasFiles = [ "${config.local.configDir}/python/aliases.sh" ];
  };
}
