{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    python27Full
    python37Full
    python38Full
    python39Full
  ];
  
  environment.shellAliases = {
    py      = "python3.9";
    python  = "python3.9";
    python2 = "python2.7";
    python3 = "python3.9";
  };
}
