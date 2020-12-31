{
  description = "A very flaky system config.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-20.09";
    nixpkgs-unstable.url = "nixpkgs/master";
    home-manager.url = "github:nix-community/home-manager/release-20.09";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  /*
    This is hideous, but by God does it just barely work.
  */

  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, home-manager, ... }:
    let
    inherit (lib) listFiles listFilesRec listModules listModulesRec;
      pkgs = nixpkgs;
      lib = nixpkgs.lib;
      mkNixosConf = host: profile:
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            home-manager.nixosModules.home-manager
            host
            profile
          ];
          specialArgs = { inherit inputs; };
        };
    in
    with builtins;
    with lib;
    with import ./lib/grok.nix { lib = lib; };
    {
      nixosConfigurations = listToAttrs (crossLists (h: p: { name = "${toLower (removeSuffix ".nix" (baseNameOf h))}-${toLower (removeSuffix ".nix" (baseNameOf p))}"; value = mkNixosConf h p; }) [ (listModules ./hosts) (listModules ./profiles) ]);
    };
}
