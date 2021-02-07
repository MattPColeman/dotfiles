{ config, pkgs, ... }:

{
  config = {
    nixpkgs.config.allowUnfree = true;
    virtualisation.docker.enable = true;

    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;
      };
    };

    # Useful for Steam IIRC
    hardware.opengl.driSupport32Bit = true;
    hardware.pulseaudio.support32Bit = true;

    fonts = {
      fontDir.enable = true;
      enableGhostscriptFonts = true;
      fonts = with pkgs; [
        corefonts
        hack-font
        iosevka
        noto-fonts
        font-awesome
        envypn-font
        unifont
      ];
    };

    time.timeZone = "Europe/London";
    console.font = "Lat2-Terminus16";
    services.xserver.autoRepeatDelay = 350;
    services.xserver.autoRepeatInterval = 22;

    security.sudo.wheelNeedsPassword = false;
    users.extraUsers.matt = {
      isNormalUser = true;
      home = "/home/matt";
      extraGroups = [ "wheel" "networkmanager" "input" "audio" "docker" ];
      uid = 1000;
      shell = pkgs.zsh;
    };

    programs.dconf.enable = true;
    nix = {
      package = pkgs.nixFlakes;
      extraOptions = ''
        experimental-features = nix-command flakes
      '';
    };
  };
}
