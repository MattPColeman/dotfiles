{ pkgs, lib, ... }:

let
  nixBinDir = "$HOME/.nix-profile/bin";
in {
  home.packages = with pkgs; [
    go
    nix
    zsh
    htop
    ncdu
    tree
    wget
    black
    godef
    gopkgs
    neovim
    nixfmt
    parted
    pipenv
    ranger
    gnumake
    neofetch
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
        # golang.Go
        bbenoist.Nix
        scala-lang.scala
        # eamodio.gitlens
        # ms-python.python
        redhat.vscode-yaml
        # hashicorp.terraform
        # tamasfe.even-better-toml
        # brettm12345.nixfmt-vscode
        # github.github-vscode-theme
        ms-azuretools.vscode-docker
      ];
      userSettings = {
        # General
        "workbench.colorTheme" = "GitHub Dark";
        "terminal.integrated.shell.osx" = "/bin/zsh";
        "explorer.confirmDragAndDrop" = false;
        "explorer.confirmDelete" = false;
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
      initExtra = "export PATH=${../bin}:$HOME/.nix-profile/bin:$PATH";
      oh-my-zsh = {
        enable = true;
        theme = "simple";
      };
      sessionVariables = {
        EDITOR = "nvim";
        VISUAL = "nvim";
      };
      shellAliases = {

        # navigation
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

        # python
        py = "python";

        # docker
        dk = "docker kill";
        dps = "docker ps";
        dka = "echo Killing containers:&& docker ps -q | xargs docker kill";
        dca = "docker image prune -f && docker container prune -f";
        dwa = "watch docker ps";

        # git
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

        # vim
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
