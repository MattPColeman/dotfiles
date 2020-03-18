#   apps.nix
#
#   Contains basic apps and utilities, as well as
#   theming and fonts

{ config, pkgs, ... }:

{

  ##-------- Proprietary software --------##
  nixpkgs.config.allowUnfree = true;

  ##-------- Enable extra terminals --------##
  #services.urxvtd.enable = true;
  #services.gnome3.gnome-terminal-server.enable = true;

  environment.systemPackages = with pkgs; [

    ##-------- Basic apps --------##
    xfce.thunar xfce.gvfs   # file browser
    xfce.terminal

    # browsers
    chromium firefox transmission-gtk

    # editors
    atom vim vscodium

    # entertainment
    spotify

    # terminal tools
    git tree ranger wget parted gnumake

    # utilities
    usbutils dropbox unar rofi
    filezilla ncdu toilet
    unclutter-xfixes
    s-tui

    ##-------- Development --------##
    R

    python3
    python36Packages.black

    scala sbt
    jre jdk ant

    docker

    go

    terraform

    ##-------- A E S T H E T I C --------##
    materia-theme       # gdk theme
    numix-cursor-theme  # cursor theme
    arc-icon-theme      # icon theme
    theme-vertex
    paper-gtk-theme
    paper-icon-theme
    #gnome3.gtk gtk2-x11# polkit polkit_gnome
    #gtk-engine-murrine# gnome3.gnome_themes_standard hicolor_icon_theme
    #gtk_engines

  ];

  # docker config
  virtualisation.docker.enable = true;

  ##-------- fonts --------##
  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      corefonts
      hack-font
      iosevka
    ];
  };
}
