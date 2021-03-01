{ pkgs, lib, ... }:

let
    binDir = ../../bin;
in {
    programs.zsh = {
        enable = true;
        autocd = true;
        dotDir = ".config/zsh";
        envExtra = ''
            source $HOME/.nix-profile/etc/profile.d/nix.sh
            export PATH=${binDir}:$HOME/.nix-profile/bin:$PATH
        '';
        dirHashes = {
            dotfiles = "$HOME/.config/dotfiles";
            root = "/";
            dev = "$HOME/Dev";
        };
        initExtra = ''
            # xdg.enable may not set these early enough
            export XDG_CACHE_HOME=$HOME/.cache
            export XDG_CONFIG_HOME=$HOME/.config
            export XDG_DATA_HOME=$HOME/.local/share

            # lf, but it drops you at the directory
            lf () {
              tmp="$(mktemp)"
              command lf --last-dir-path="$tmp" "$@"
              if [ -f "$tmp" ]; then
                  dir="$(cat "$tmp")"
                  rm -f "$tmp"
                  if [ -d "$dir" ]; then
                      if [ "$dir" != "$(pwd)" ]; then
                          cd "$dir" && clear && ls --color=auto
                      fi
                  fi
              fi
            }

            # "go to"
            gt () {
              case "$1" in
                  c|cf|conf|config )  target="$HOME/.config" ;;
                  dl|down|downloads ) target="$HOME/Downloads" ;;
                  df|dot|dotfiles )   target="$HOME/.config/dotfiles" ;;
                  d|dv|dev )          target="$HOME/Dev" ;;
                  * )                 cd "$@" && return 0 ;;
              esac
              cd $target
            }
        '';
        oh-my-zsh = {
            enable = true;
            theme = "simple";
            plugins = [ "sudo" "vscode" ];
        };
        sessionVariables = {
            DOTFILES_DIR = "$HOME/.config/dotfiles";
            EDITOR = "nvim";
            VISUAL = "nvim";
            BROWSER = "firefox";
            TERMINAL = "alacritty";
            FILE_MANAGER = "lf";
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

            python = "python3";
            py = "python3";
            py3 = "python3";
            py2 = "python2";

            dk = "docker kill";
            dps = "docker ps";
            dka = "echo Killing containers:&& docker ps -q | xargs docker kill";
            dca = "docker image prune -f && docker container prune -f && docker system prune -f";
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
}
