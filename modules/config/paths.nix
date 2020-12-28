{ self, lib, ... }:

with lib;
rec {
  dotfilesDir = toString ../../.;
  configDir   = "${dotfilesDir}/config";
}
