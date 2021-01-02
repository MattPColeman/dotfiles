{ config, pkgs, ... }:

{
  /*
      WIP - the full desktop experience.

      This represents the desired end-state of my nixos conf.
      Should be configurable:
      * system-wide (system services, greeter, )
      * per-user (WM, pkgs, themes, tools...)
      * home-manager for actual dotfiles (usable on macOS?)
      * themes per-user

      Options referenced here do not yet exist...
  */
  config = {
    environment.variables.CURRENT_SYSTEM_PROFILE = "desktop-full";
    
    modules = {
      system = {
        shell.zsh.enable = true;
        virtualisation.docker.enable = true;
        greeter.lightdm.enable = true;
      };
      
      user.matt = {
        groups = [ "wheel" "networkmanager" "input" "audio" "docker" ];
        uid = 1000;
        passwordFile = "${config.local.secretsDir}/matt/passwd_hash";
        ssh = {
          enabled = true;
          authorized_keys = ["${config.local.secretsDir}/matt/ssh_pubkey"];
        };
        desktop = {
          manager.i3 = {
            enable = true;
            composite = true;
          };
          spotlight.rofi.enable = true;
          apps = with userApps; [ firefox atom spotify thunar transmission urxvt ];
        };
        shellTools = {
          git.enable = true;
          vim.enable = true;
          misc.enable = true;
        };
        devTools = with userApps; [ go java scala python R terraform ];
        games = {
          steam.enable = true;
          emulation.enable = true;
          otherGames = with userApps; [ df nethack ];
        };
        defaults = {
          editor = "atom";
          browser = "firefox";
          term = "urxvt";
        };
        theme = "alucard";
      };
      
      user.leanne = {
        groups = [ "networkmanager" ];
        uid = 1001;
        passwordFile = "${config.local.secretsDir}/leanne/passwd_hash";
        desktop = {
          manager.gnome.enable = true;
          spotlight.rofi.enable = true;
          apps = [ firefox ];
        };
        theme = "dracula";
      };
    };
  };

  imports = [ ../modules ];
}
