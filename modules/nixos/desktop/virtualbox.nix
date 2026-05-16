{ ... }:

{
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "lispectre" ]; # should be per user in /home/{user} configuration
}
