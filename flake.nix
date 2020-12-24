{
  description = "A very flaky system config.";

  inputs = {
    nixpkgs.url          = "github:NixOS/nixpkgs/nixos-20.09";
    nixpkgs-unstable.url = "nixpkgs/master";
  };

  outputs = inputs @ { self, nixpkgs, nixpkgs-unstable, ... }: {

    nixosConfigurations.migo-desktop-full = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./nixos/hardware/MiGo.nix ./nixos/systems/desktop-full.nix ];
      specialArgs = { inherit inputs; };
    };

  };
}
