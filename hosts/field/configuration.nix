
{ pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = [ "zfs.zfs_arc_max=8589934592" ]; # 8GB

  i18n.defaultLocale = "en_US.UTF-8";
  services.openssh.enable = true;
  system.stateVersion = "25.11";

}
