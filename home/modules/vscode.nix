{ pkgs, lib, ... }:

{
    programs = {
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
                "window.menuBarVisibility" = "toggle";
                "terminal.integrated.shell.osx" = "/bin/zsh";
                "breadcrumbs.enabled" = false;
                "update.mode" = "none";
                "explorer.confirmDragAndDrop" = false;
                "explorer.confirmDelete" = false;
                "editor.formatOnSave" = true;
                "editor.scrollbar.horizontal" = "hidden";
                "editor.scrollbar.vertical" = "hidden";
                "editor.hideCursorInOverviewRuler" = true;
                "editor.overviewRulerBorder" = false;
                "editor.overviewRulerLanes" = 0;
                "editor.renderIndentGuides" = true;
                "files.insertFinalNewline" = true;

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
                "python.linting.flake8Args" = ["--max-line-length=88"];

                "nixfmt.path" = "${pkgs.nixfmt}/bin/nixfmt";
            };
        };
    };
}
