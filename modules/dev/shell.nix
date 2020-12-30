{ options, config, pkgs, lib, ... }:

{
  options = {
    modules.shells.zsh = with lib.types; {
      enable = lib.mkOption { type = bool; default = true; };
      aliasFiles = lib.mkOption { type = (listOf (either str path)); default = []; };
      envFiles = lib.mkOption { type = (listOf (either str path)); default = []; };
    };
  };

  config = lib.mkIf config.modules.shells.zsh.enable {
    users.defaultUserShell = pkgs.zsh;
    environment.systemPackages = [ pkgs.zsh ];

    # Required for zsh to conform to XDG. Avoids boostrap problem?
    environment.variables = {
      ZDOTDIR = "$XDG_CONFIG_HOME/zsh";
      ZSH_CACHE = "$XDG_CACHE_HOME/zsh";
    };

    home.configFile = {
      "zsh" = {
        source = "${config.local.configDir}/zsh";
        recursive = true;
      };
      "zsh/extra_aliases.sh".text = ''
        # This file was autogenerated with Nix, and may be overwritten!
        ${lib.strings.concatMapStrings (path: "source '${path}'\n") config.modules.shell.zsh.aliasFiles}
      '';
      "zsh/extra_environment.sh".text = ''
        # This file was autogenerated with Nix, and may be overwritten!
        ${lib.strings.concatMapStrings (path: "source '${path}'\n") config.modules.shell.zsh.envFiles}
      '';
    };
  };
}
