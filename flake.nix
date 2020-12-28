{
  description = "A very flaky system config.";

  inputs = {
    nixpkgs.url          = "github:NixOS/nixpkgs/nixos-20.09";
    nixpkgs-unstable.url = "nixpkgs/master";
    home-manager.url     = "github:rycee/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ { self, nixpkgs, nixpkgs-unstable, ... }: {

    nixosConfigurations.migo-desktop-full = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./hosts/MiGo.nix ./profiles/desktop-full.nix ];
      specialArgs = { inherit inputs; };
    };

    nixosConfigurations.dagon-desktop-mini = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./hosts/Dagon.nix ./profiles/desktop-mini.nix ];
      specialArgs = { inherit inputs; };
    };

  };
}
