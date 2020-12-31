{ options, config, lib, pkgs, ... }:

with lib; let cfg = config.modules.games.df; in
{
  options.modules.games.df.enable = mkEnableOption "df";

  config = {
    environment.systemPackages = with pkgs;
      [
        (
          pkgs.dwarf-fortress-packages.dwarf-fortress-full.override {
            theme = "jolly-bastion";
          }
        )
      ];
  };
}
