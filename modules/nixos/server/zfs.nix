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
        echo 'while ! zfs load-key -a; do sleep 5; done && kill $(pidof zfs) && exit' >> /root/.profile
      '';
    };
    availableKernelModules = ["e1000e"];
  };
}
