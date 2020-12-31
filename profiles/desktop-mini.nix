{ config, pkgs, ... }:

{
  /* 
      WIP - for (slightly) weaker machines.
  */
  config = {
    environment.variables.CURRENT_SYSTEM_PROFILE = "desktop-mini";
    
        modules.shell = {
          zsh.enable = true;
          git.enable = true;
          vim.enable = true;
        };

        modules.desktop = {
          greeter.lightdm.enable = true;
          manager = {
            i3.enable = true;
          };
          spotlight.rofi.enable = true;
          apps = {
            firefox.enable = true;
            atom.enable = true;
          };
        };

      };

      imports = [ ../modules ];
    }
