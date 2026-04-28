{ config, ... }:
{
  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Warsaw";
  networking.nftables.enable = true;
  networking.firewall = {
    enable = true;
    trustedInterfaces = [ "tailscale0" ];
    allowedUDPPorts = [ config.services.tailscale.port ];
  };
  systemd.network.wait-online.enable = false;
}
