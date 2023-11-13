{
  description = "My nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    impermanence.url = "github:nix-community/impermanence";
  };

  outputs = { nixpkgs, impermanence, home-manager, ... }:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        jirka-nixos = nixpkgs.lib.nixosSystem {

          inherit system;
          modules = [
            impermanence.nixosModules.impermanence
            ./nixos/main.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useUserPackages = true;
                useGlobalPkgs = true;
                users.jirka = ./home/main.nix;
              };
            }
          ];
        };
      };
    };
}
