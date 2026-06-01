{ config, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.zfs.forceImportRoot = false;
  boot.kernelParams = [ "zfs.zfs_arc_max=8589934592" ]; # Restricting ZFS cache to 8 GB.
  programs.nix-ld.enable = true; # TEMP

  # Can't use latest kernel due to ZFS drivers sometimes not being up to date.
  # Current (May 2nd, 2026) ZFS release, 2.4.1, supports kernel up to 6.19.
  # Also, Nvidia drivers cause issues sometimes for some reason.
  # boot.kernelPackages = pkgs.linuxPackages_latest;


  # SMB client things, @Todo: move this!
  sops.secrets."smb-password" = {
    owner = "root";
    mode = "0400";
  };

  system.activationScripts.samba-credentials = {
    deps = [ "setupSecrets" ];
    text = ''
      install -Dm400 /dev/null /etc/samba/smb-credentials
      echo "username=lispectre" > /etc/samba/smb-credentials
      echo "password=$(cat ${config.sops.secrets."smb-password".path})" >> /etc/samba/smb-credentials
    '';
  };

  fileSystems."/mnt/field/media" = {
    device = "//field/media";
    fsType = "cifs";
    options = [
      "credentials=/etc/samba/smb-credentials"
      "uid=1000"
      "gid=100"
      "nofail"
      "x-systemd.automount"
      "x-systemd.idle-timeout=60"
    ];
  };
}

