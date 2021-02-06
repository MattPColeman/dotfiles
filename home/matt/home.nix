{ pkgs, lib, ... }:

let
  nixBinDir = "/Users/matt.coleman/.nix-profile/bin";
  firefoxDMG = pkgs.stdenv.mkDerivation rec {
    pname = "Firefox";
    version = "84.0.2";

    buildInputs = [ pkgs.undmg ];
    sourceRoot = ".";
    phases = [ "unpackPhase" "installPhase" ];
    installPhase = ''
      mkdir -p "$out/Applications"
      cp -r Firefox.app "$out/Applications/Firefox.app"
    '';

    src = pkgs.fetchurl {
      name = "Firefox-${version}.dmg";
      url =
        "https://download-installer.cdn.mozilla.net/pub/firefox/releases/${version}/mac/en-GB/Firefox%20${version}.dmg";
      sha256 =
        "45ca188963f808297f4c6fd9119e9333aa8561a585523f57f5bcfe98e09dabb6";
    };

    meta = with pkgs.stdenv.lib; {
      description = "Firefox seems to be broken on Darwin. Sad!";
      platforms = platforms.darwin;
    };
  };
in {
  home.packages = with pkgs; [
    go
    nix
    zsh
    htop
    tree
    black
    godef
    gopkgs
    neovim
    nixfmt
    pipenv
    ranger
    vscodium
    coreutils
    inetutils
    nerdfonts
    terraform
    home-manager
    python37Full
    python37Packages.pylint
    python37Packages.flake8
  ];

  fonts.fontconfig.enable = true;

  programs = {
    firefox = {
      enable = true;
      package = lib.mkIf pkgs.stdenv.isDarwin firefoxDMG;
    };
    emacs.enable = true;
    git = {
      enable = true;
      userName = "Matt Coleman";
      userEmail = "matt.coleman@sainsburys.co.uk";
      extraConfig = {
        pull.rebase = "false";
        init.defaultBranch = "master";
      };
    };
    vscode = {
      enable = true;
      package = pkgs.vscodium;
      extensions = with pkgs.vscode-extensions; [
        golang.Go
        bbenoist.Nix
        scala-lang.scala
        # eamodio.gitlens
        # ms-python.python
        redhat.vscode-yaml
        # hashicorp.terraform
        tamasfe.even-better-toml
        brettm12345.nixfmt-vscode
        github.github-vscode-theme
        ms-azuretools.vscode-docker
      ];
      userSettings = {
        # General
        "workbench.colorTheme" = "GitHub Dark";
        "terminal.integrated.shell.osx" = "/bin/zsh";
        "explorer.confirmDragAndDrop" = false;
        "editor.formatOnSave" = true;

        # Git
        "git.confirmSync" = false;
        "gitlens.codeLens.enabled" = false;

        # Go
        "go.inferGopath" = true;
        "go.formatTool" = "gofmt";
        "go.useGoProxyToCheckForToolUpdates" = false;

        # Python
        "python.formatting.provider" = "black";
        "python.formatting.blackPath" = "${nixBinDir}/black";
        "python.linting.pylintEnabled" = false;
        "python.linting.pylintPath" = "${nixBinDir}/pylint";
        "python.linting.flake8Enabled" = true;
        "python.linting.flake8Path" = "${nixBinDir}/flake8";

        # Nix
        "nixfmt.path" = "/Users/matt.coleman/.nix-profile/bin/nixfmt";
      };
    };
    ssh.enable = true;
    zsh = {
      enable = true;
      autocd = true;
      dotDir = ".config/zsh";
      envExtra = "source $HOME/.nix-profile/etc/profile.d/nix.sh";
      initExtra = "export PATH=$HOME/.nix-profile/bin:$PATH";
      oh-my-zsh = {
        enable = true;
        theme = "simple";
      };
      sessionVariables = {
        EDITOR = "nvim";
        VISUAL = "nvim";
      };
      shellAliases = {
        ls = "ls --color=auto";
        l = "ls --color=auto";
        ll = "ls -Al";
        la = "ls -A";
        lla = "ls -lA";
        lal = "ls -Al";
        c = "clear";
        cl = "clear";
        cdd = "cd ~/dev";
        treee = "tree -a -I '.git'";
        py = "python";
        dk = "docker kill";
        dps = "docker ps";
        dka = "echo Killing containers:&& docker ps -q | xargs docker kill";
        dca = "docker image prune -f && docker container prune -f";
        dwa = "watch docker ps";
        gst = "git status";
        gs = "git status";
        gc = "git commit";
        gd = "git diff";
        gcm = "git checkout master";
        gco = "git checkout";
        gcoo = "git checkout -- .";
        gpull = "git pull";
        gpush = "git push";
        gp = "git pull";
        gf = "git fetch";
        v = "nvim";
        vi = "nvim";
        vim = "nvim";
        nv = "nvim";
        nvi = "nvim";
        neovim = "nvim";
      };
    };
  };
}
