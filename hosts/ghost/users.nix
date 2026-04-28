{ pkgs, ... }:
{
 users.users.lispectre = {
   isNormalUser = true;
   extraGroups = [ "wheel" "networkmanager" ];
   packages = with pkgs; [];
   openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJcR+9DmxgebYegjk3ls4DXuwgfOsBZS1h0JVYxUxDh8 lispectre@ghost" ];
 }; 
}

