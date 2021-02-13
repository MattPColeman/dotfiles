{
  description = "A very flaky system config.";

  inputs = {
    nixpkgs.url = "nixpkgs/master";
    home-manager.url = "github:nix-community/home-manager/release-20.09";
  };

  outputs = { nixpkgs, home-manager, ... }: {
    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/MiGo.nix
        ./profiles/desktop.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.matt = { ... }: {
            imports = [./home/nixos-specific.nix];
          };
        }
      ];
    };
  };
}
