{ config, pkgs, ... }:

{
  /*
      The full desktop experience.
  */
  config = {
    environment.variables.CURRENT_SYSTEM_PROFILE = "desktop-full";

    modules.shell = {
      zsh.enable = true;
      git.enable = true;
      misc.enable = true;
      vim.enable = true;
    };

    modules.dev = {
      go.enable = true;
      java.enable = true;
      python.enable = true;
      R.enable = true;
      terraform.enable = true;
    };

    modules.virtualisation = {
      docker.enable = true;
    };

    modules.desktop = {
      greeter.lightdm.enable = true;
      manager = {
        i3.enable = true;
        compositing.enable = true;
      };
      spotlight.rofi.enable = true;
      apps = {
        firefox.enable = true;
        atom.enable = true;
        spotify.enable = true;
        thunar.enable = true;
        transmission.enable = true;
      };
    };

    modules.games = {
      steam.enable = true;
      df.enable = true;
    };

    modules.extraThemes.enable = true;
  };

  imports = [ ../modules ];
}
