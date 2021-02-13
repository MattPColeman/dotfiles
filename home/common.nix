{ pkgs, lib, ... }:

let
  configDir = ../config;
in {
  home.packages = with pkgs; [
    ncdu
    tree
    wget
    gnumake
    neofetch
    coreutils
    inetutils

    terraform

    nix
    nixfmt

    black
    pipenv
    python37Full
    python37Packages.pylint
    python37Packages.flake8
    python37Packages.ptpython
  ];

  fonts.fontconfig.enable = true;

  programs = {
    firefox.enable = true;
    home-manager.enable = true;
    htop = {
      enable = true;
      enableMouse = true;
    };
    emacs.enable = true;
    go.enable = true;
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      withPython3 = true;
    };
    lf.enable = true;
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
        # dracula-theme.theme-dracula
      ];
      userSettings = {
        "workbench.colorTheme" = "Dracula";
        "window.menuBarVisibility" = "toggle";
        "terminal.integrated.shell.osx" = "/bin/zsh";
        "explorer.confirmDragAndDrop" = false;
        "explorer.confirmDelete" = false;
        "editor.formatOnSave" = true;
        "files.insertFinalNewline" = true;

        "git.confirmSync" = false;
        "gitlens.codeLens.enabled" = false;

        "go.inferGopath" = true;
        "go.formatTool" = "gofmt";
        "go.useGoProxyToCheckForToolUpdates" = false;

        "python.formatting.provider" = "black";
        "python.formatting.blackPath" = "${pkgs.black}/bin/black";
        "python.linting.pylintEnabled" = false;
        "python.linting.pylintPath" = "${pkgs.python37Packages.pylint}/bin/pylint";
        "python.linting.flake8Enabled" = true;
        "python.linting.flake8Path" = "${pkgs.python37Packages.flake8}/bin/flake8";
        "python.linting.flake8Args" = ["--max-line-length=88"];

        "nixfmt.path" = "${pkgs.nixfmt}/bin/nixfmt";
      };
    };
    ssh.enable = true;
    zsh = {
      enable = true;
      autocd = true;
      dotDir = ".config/zsh";
      envExtra = "source $HOME/.nix-profile/etc/profile.d/nix.sh";
      initExtra = ''
        export PATH=${../bin}:$HOME/.nix-profile/bin:$PATH
        lf () {
          tmp="$(mktemp)"
          command lf --last-dir-path="$tmp" "$@"
          if [ -f "$tmp" ]; then
              dir="$(cat "$tmp")"
              rm -f "$tmp"
              if [ -d "$dir" ]; then
                  if [ "$dir" != "$(pwd)" ]; then
                      cd "$dir" && clear && ls
                  fi
              fi
          fi
        }
      '';
      oh-my-zsh = {
        enable = true;
        theme = "simple";
        plugins = [ "sudo" "vscode" ];
      };
      sessionVariables = {
        EDITOR = "nvim";
        VISUAL = "nvim";
        BROWSER = "firefox";
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

        python = "python3 -m ptpython";
        python2 = "python2 -m ptpython";
        py = "python3 -m ptpython";
        py2 = "python2 -m ptpython";

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
      };
    };
  };
  xdg = {
    enable = true;
    configFile = {
      "ptpython/config.py".source = "${configDir}/ptpython/config.py";
    };
  };
}
