{ options, config, pkgs, lib, ... }:

with lib; let cfg = config.modules.shell.git; in
{
  options.modules.shell.git.enable = mkEnableOption "git";

  config = mkIf cfg.enable {
    environment.systemPackages = [ pkgs.git ];
    home.configFile."git/config".source = "${config.local.configDir}/git/config";
    modules.shell.zsh.aliasFiles = [ "${config.local.configDir}/git/aliases.sh" ];
  };
}
