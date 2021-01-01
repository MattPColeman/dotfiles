{
  description = "A very flaky system config.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-20.09";
    nixpkgs-unstable.url = "nixpkgs/master";
    home-manager = {
      url                    = "github:nix-community/home-manager/release-20.09";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, home-manager, ... }:
    let
      inherit (lib) toLower removeSuffix;

      pkgs  = nixpkgs;
      uPkgs = nixpkgs-unstable;
      lib   = nixpkgs.lib.extend (self: super: { my = import ./lib { lib = self; }; });

      extraModules = [ home-manager.nixosModules.home-manager ];

      mkNixosSystem = host: profile:
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = extraModules ++ [ host profile ];
          specialArgs = { inherit lib inputs; };
        };

      moduleName = m: toLower (removeSuffix ".nix" (baseNameOf m));
      mkNixosSystemName = host: profile: moduleName host + "-" + moduleName profile;
      mapNixosSystems = host: prof: {name = mkNixosSystemName host prof; value = mkNixosSystem host prof; };

    in with lib; with lib.my; {
      nixosConfigurations = listToAttrs (
        crossLists mapNixosSystems [ (listModules ./hosts) (listModules ./profiles) ]
      );
    };
}
