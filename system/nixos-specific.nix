{ config, pkgs, ... }:
{
  imports = [ ./common.nix ];

  config = {
    security.sudo.wheelNeedsPassword = false;
    users.extraUsers.matt = {
      isNormalUser = true;
      home = "/home/matt";
      extraGroups = [ "wheel" "networkmanager" "input" "audio" "docker" ];
      uid = 1000;
      shell = pkgs.zsh;
    };

    hardware = {
      opengl.driSupport32Bit = true;
      pulseaudio.support32Bit = true;
    };

    environment.systemPackages = with pkgs; [ zsh unclutter ];
    virtualisation.docker.enable = true;
    programs.dconf.enable = true;

    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;
      };
    };

    console.keyMap = "uk";
    services.xserver = {
      layout = "gb";
      autoRepeatDelay = 350;
      autoRepeatInterval = 22;
    };
  };
}
