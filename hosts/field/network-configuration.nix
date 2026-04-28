{ config, ... }:

{
  networking.networkmanager.enable = true;
  networking.useDHCP = false;
  networking.interfaces.eno1.useDHCP = true;
  time.timeZone = "Europe/Warsaw";
  networking.nftables.enable = true;
  networking.firewall = {
    enable = true;
    trustedInterfaces = [ "tailscale0" ];
    allowedUDPPorts = [ config.services.tailscale.port ];
  };
}
