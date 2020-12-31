{ lib, ... }:

with builtins;
with lib;
{
  imports = filter (mod: baseNameOf mod != "default.nix") (listModulesRec ./.);
}
