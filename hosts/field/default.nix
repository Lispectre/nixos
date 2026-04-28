{
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
    ./network-configuration.nix
    ./users.nix
    ./disk-configuration.nix
    ./secret-configuration.nix

    ../../modules/nixos/core.nix
    ../../modules/nixos/server/zfs.nix
    ../../modules/nixos/server/ssh.nix
    ../../modules/nixos/server/tailscale.nix
    ../../modules/nixos/server/forgejo.nix
    ../../modules/nixos/server/caddy.nix
  ];

  networking.hostName = "field";
  networking.hostId = "cc8ee504";  
  system.stateVersion = "25.11";
}
