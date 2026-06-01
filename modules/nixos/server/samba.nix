{ ... }:

{
  services.samba = {
    enable = true;
    openFirewall = true;

    settings = {
      global = {
        "workgroup" = "WORKGROUP";
        "server string" = "field";
        "server role" = "standalone server";
        "security" = "user";
        "load printers" = "no";
        "printcap name" = "/dev/null";
        "hosts allow" = "192.168.1. 100.64.0.0/10 127.0.0.1";
        "hosts deny" = "0.0.0.0/0";
      };

      "media" = {
        "path" = "/mnt/data/media";
        "browseable" = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "create mask" = "0644";
        "directory mask" = "0755";
        "valid users" = "lispectre";
      };
    };
  };

  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };
}
