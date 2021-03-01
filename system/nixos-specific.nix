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

    hardware.opengl.driSupport32Bit = true; # steam
    hardware.pulseaudio.support32Bit = true; # steam
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

    fonts = {
      fontDir.enable = true;
      enableGhostscriptFonts = true;
      fonts = with pkgs; [ corefonts hack-font iosevka noto-fonts font-awesome envypn-font unifont ];
    };

    i18n.defaultLocale = "en_US.UTF-8";
    time.timeZone = "Europe/London";
    console.font = "Lat2-Terminus16";
    console.keyMap = "uk";
    services.xserver = { layout = "gb"; };
    services.xserver.autoRepeatDelay = 350;
    services.xserver.autoRepeatInterval = 22;

  };
}
