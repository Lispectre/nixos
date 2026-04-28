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
        DOMAIN = "field.tail1c9f34.ts.net";
        ROOT_URL = "https://${srv.DOMAIN}/git/";
        SERVE_FROM_SUB_PATH = true;
        HTTP_PORT = 3000;
        SSH_PORT = lib.head config.services.openssh.ports;
      };
      service.DISABLE_REGISTRATION = false;
      # actions = {
        # ENABLED = true;
        # DEFAULT_ACTION_URL = "github";
      # };
    };
  };
}
