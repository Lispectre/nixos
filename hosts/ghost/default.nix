{
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
    ./network-configuration.nix
    ./users.nix


    ../../modules/nixos/core.nix
     ../../modules/nixos/desktop/kde.nix
     ../../modules/nixos/desktop/pipewire.nix
     ../../modules/nixos/desktop/gamemode.nix
     ../../modules/nixos/hardware/nvidia.nix
  ];

  networking.hostName = "ghost";
  networking.hostId = "8eaf7ed5";
  system.stateVersion = "25.11";
}
