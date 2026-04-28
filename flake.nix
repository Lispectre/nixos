{
  description = "NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager-unstable = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs@{ nixpkgs, nixpkgs-unstable, home-manager, home-manager-unstable, disko, ... }:
  let
    user = "lispectre";
    mkSystem = { system, name, pkgs ? nixpkgs, hm ? home-manager, homeCfg ? ./home/${user}/home.nix, extraModules ? [] }:
      let lib = pkgs.lib;
      in lib.nixosSystem {
        specialArgs = { inherit inputs user; };
        modules = [
          { nixpkgs.pkgs = import pkgs.outPath { inherit system; config.allowUnfree = true; }; }
          ./hosts/${name}
          hm.nixosModules.home-manager {
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
        pkgs = nixpkgs-unstable;
        hm = home-manager-unstable;
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
