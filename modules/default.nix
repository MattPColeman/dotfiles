{ lib, ... }:

with builtins;
with lib;
with lib.my;
{
  imports = filter (mod: baseNameOf mod != "default.nix") (listModulesRec ./.);
}
