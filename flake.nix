{
  description = "A very flaky system config.";

  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, darwin, ... }: {

    nixosConfigurations.migo = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/migo.nix
        ./system/nixos-specific.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.matt = { ... }:
            { imports = [ ./home/nixos-specific.nix ./themes/dracula ]; };
        }
      ];
    };

    darwinConfigurations.dagon = darwin.lib.darwinSystem {
      modules = [
        ./system/macos-specific.nix
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users."matt.coleman" = { ... }:
            { imports = [ ./home/macos-specific.nix ./themes/dracula ]; };
        }
      ];
    };

  };
}
