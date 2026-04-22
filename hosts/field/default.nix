{
  imports = [
    ./hardware-configuration.nix
    ./disk-config.nix
    ./users.nix
    ../../modules/nixos/core.nix
    ./configuration.nix
    # ../../modules/nixos/server/base.nix
    ../../modules/nixos/server/zfs.nix
  ];

  networking.hostName = "field";
  networking.hostId = "cc8ee504";  
}
