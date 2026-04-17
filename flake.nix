{
  description = "NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, fenix, ... }: 
    let
      user = "lispectre";
      lib = nixpkgs.lib;

      mkSystem = system: name:
        lib.nixosSystem {
          system = system;
          specialArgs = { inherit inputs user; };
          modules =  [
              ./hosts/${name}
              
              home-manager.nixosModules.home-manager {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.${user} = import ./home/${user}/home.nix;
                home-manager.backupFileExtension = "backup"; 
              }
            ];
        };
    in {
      nixosConfigurations = {
        # Desktop
        ghost = mkSystem "x86_64-linux" "ghost";
      };
  };
}
