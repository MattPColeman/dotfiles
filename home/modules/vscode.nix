{ pkgs, lib, ... }:
{
  programs = {
    vscode = {
      enable = true;
      package = pkgs.vscodium;
      extensions = with pkgs.vscode-extensions; [
        ms-azuretools.vscode-docker
        # golang.Go
        # eamodio.gitlens
        # hashicorp.terraform
        bbenoist.Nix
        # ms-python.python
        scala-lang.scala
        redhat.vscode-yaml
      ];
      userSettings = {
        "window.menuBarVisibility" = "toggle";
        "terminal.integrated.shell.osx" = "/bin/zsh";
        "breadcrumbs.enabled" = false;
        "update.mode" = "none";
        "explorer.confirmDragAndDrop" = false;
        "explorer.confirmDelete" = false;
        "editor.formatOnSave" = false;
        "editor.scrollbar.horizontal" = "hidden";
        "editor.scrollbar.vertical" = "hidden";
        "editor.hideCursorInOverviewRuler" = true;
        "editor.overviewRulerBorder" = false;
        "editor.overviewRulerLanes" = 0;
        "editor.renderIndentGuides" = true;
        "files.insertFinalNewline" = true;

        "diffEditor.ignoreTrimWhitespace" = false;
        "scm.diffDecorations" = "gutter";
        "gitlens.changes.locations" = [ "gutter" ];
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
        "python.linting.flake8Args" = [ "--max-line-length=88" ];

        "nixfmt.path" = "${pkgs.nixfmt}/bin/nixfmt";
      };
    };
  };
}
