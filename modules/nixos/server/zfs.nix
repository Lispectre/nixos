{ ... }:
{
  boot.zfs.requestEncryptionCredentials = true;
  boot.initrd = {
    network = {
      enable = true;
      ssh = {
        enable = true;
        port = 2222;
        hostKeys = ["/etc/ssh/initrd_ssh_host_ed25519_key"];
        authorizedKeys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJcR+9DmxgebYegjk3ls4DXuwgfOsBZS1h0JVYxUxDh8 lispectre@ghost"
          # TODO: laptop key
        ];
      };
      postCommands = ''
        echo 'zfs load-key -a && kill $(pidof zfs) && exit' >> /root/.profile
      '';
    };
    services.swapDevices = []; # To avoid stalling while waiting for swap.
    availableKernelModules = ["e1000e"];
  };
}
