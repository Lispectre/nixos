{
  description = "NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs@{ nixpkgs, home-manager, disko, ... }:
  let
    user = "lispectre";
    lib = nixpkgs.lib;

    mkSystem = { system, name, homeCfg ? ./home/${user}/home.nix, extraModules ? [] }:
      lib.nixosSystem {
        system = system;
        specialArgs = { inherit inputs user; };
        modules = [
          ./hosts/${name}
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${user} = import homeCfg;
            home-manager.backupFileExtension = "backup";
          }
        ] ++ extraModules;
      };
  in {
    nixosConfigurations = {
      ghost = mkSystem {
        system = "x86_64-linux";
        name = "ghost";
      };
      field = mkSystem {
        system = "x86_64-linux";
        name = "field";
        homeCfg = ./home/${user}/home-server.nix;
        extraModules = [
          disko.nixosModules.disko
        ];
      };
    };
  };
}
