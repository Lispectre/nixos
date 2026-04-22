{ pkgs, ... }:

{
  users.users.lispectre = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    packages = with pkgs; [
    ];
  };
}
