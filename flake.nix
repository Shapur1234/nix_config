{
  description = "My nix config";

  inputs = {
    # TODO: Change to stable once 23.11 comes out
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    impermanence = {
      url = "github:nix-community/impermanence";
    };
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
            ./nixos/default.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useUserPackages = true;
                useGlobalPkgs = true;
                users.jirka = ./home/default.nix;
              };
            }
          ];
        };
      };
    };
}
