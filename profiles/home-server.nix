{ config, pkgs, ... }:

{
  /* 
      WIP - does not yet exist.
  */
  config = {
    environment.variables.CURRENT_SYSTEM_PROFILE = "home-server";

    modules.shell = {
      zsh.enable  = true;
      git.enable  = true;
    };
    
    modules.virtualisation = {
      docker.enable = true;
    };

  imports = [ ../modules/. ];
}
