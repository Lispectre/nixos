{ ... }:

{
  networking.networkmanager.enable = true;
  networking.useDHCP = false;
  networking.interfaces.eno1.useDHCP = true;
  time.timeZone = "Europe/Warsaw";
}
