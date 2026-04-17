{
  imports = [

    ./hardware-configuration.nix
    ./users.nix
    ../../modules/nixos/core.nix
    ./configuration.nix

     ../../modules/nixos/desktop/kde.nix
     ../../modules/nixos/desktop/pipewire.nix
     ../../modules/nixos/hardware/nvidia.nix
  ];

  networking.hostName = "ghost";
  networking.hostId = "8eaf7ed5";
}
