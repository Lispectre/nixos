
{ pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  i18n.defaultLocale = "en_US.UTF-8";
  services.openssh.enable = true;
  system.stateVersion = "25.11"; # Did you read the comment?

}
