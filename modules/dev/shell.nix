{ config, pkgs, home-manager, ... }:

{
  users.defaultUserShell = pkgs.zsh;
  environment.systemPackages = [ pkgs.zsh ];
  environment.shellAliases = {
    ls    = "ls --color=auto";
    l     = "ls --color=auto";
    ll    = "ls -Al";
    la    = "ls -A";
    c     = "clear";
    treee = "tree -a -I '.git'";
  };
  environment.variables = {
    ZDOTDIR = "$XDG_CONFIG_HOME/zsh";
    ZSH_CACHE = "$XDG_CACHE_HOME/zsh";
  };
  home.configFile = with config.local; {
    "zsh" = { source = "${configDir}/zsh"; recursive = true; };
  };
}
