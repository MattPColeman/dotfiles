{ pkgs, lib, ... }:
{
  programs = {
    vscode = {
      enable = true;
      package = pkgs.vscodium;
      extensions = with pkgs.vscode-extensions; [
        ms-azuretools.vscode-docker
        eamodio.gitlens
        golang.Go
        hashicorp.terraform
        bbenoist.Nix
        # ms-python.python
        scala-lang.scala
        redhat.vscode-yaml
        file-icons.file-icons
      ];
      keybindings = [
        { key = "cmd+g"; command = "workbench.scm.focus"; }
        { key = "cmd+b"; command = "workbench.files.action.focusFilesExplorer"; }
        { key = "cmd+escape"; command = "workbench.action.closeSidebar"; }
      ];
      userSettings = with pkgs; {
        "http.proxyStrictSSL" = false;
        "window.menuBarVisibility" = "toggle";
        "terminal.integrated.shell.osx" = "/bin/zsh";
        "breadcrumbs.enabled" = false;
        "update.mode" = "none";
        "explorer.confirmDragAndDrop" = false;
        "explorer.confirmDelete" = false;
        "files.insertFinalNewline" = true;
        "files.autoSave" = "onFocusChange";

        "editor.formatOnSave" = false;
        "editor.scrollbar.horizontal" = "hidden";
        "editor.scrollbar.vertical" = "hidden";
        "editor.hideCursorInOverviewRuler" = true;
        "editor.overviewRulerBorder" = false;
        "editor.overviewRulerLanes" = 0;
        "editor.renderIndentGuides" = false;
        "editor.fontFamily" = "Fira Code";
        "editor.fontLigatures" = true;
        "editor.fontSize" = 14;
        "workbench.iconTheme" = null;
        "workbench.tree.renderIndentGuides" = "none";

        "git.confirmSync" = false;
        "gitlens.codeLens.enabled" = false;
        "diffEditor.ignoreTrimWhitespace" = false;
        "gitlens.changes.locations" = [ "gutter" ];
        "scm.diffDecorations" = "gutter";

        "go.formatTool" = "gofmt";
        "go.useGoProxyToCheckForToolUpdates" = false;

        "python.formatting.provider" = "black";
        "python.formatting.blackPath" = "${python37Packages.black}/bin/black";
        "python.linting.pylintEnabled" = false;
        "python.linting.pylintPath" = "${python37Packages.pylint}/bin/pylint";
        "python.linting.flake8Enabled" = true;
        "python.linting.flake8Path" = "${python37Packages.flake8}/bin/flake8";
        "python.linting.flake8Args" = [ "--max-line-length=88" ];

        "nixfmt.path" = "${nixfmt}/bin/nixfmt";
      };
    };
  };
}
