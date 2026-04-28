{ config, lib, ... }:

let
  cfg = config.services.forgejo;
  srv = cfg.settings.server;
in
{
  services.forgejo = {
    enable = true;
    database.type = "postgres";
    lfs.enable = true;
    settings = {
      server = {
        DOMAIN = "git.local";
        ROOT_URL = "http://${srv.DOMAIN}/";
        HTTP_PORT = 3000;
        SSH_PORT = lib.head config.services.openssh.ports;
      };
      service.DISABLE_REGISTRATION = true;
      # actions = {
        # ENABLED = true;
        # DEFAULT_ACTION_URL = "github";
      # };
    };
  };
}
