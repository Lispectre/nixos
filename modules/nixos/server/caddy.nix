{ ... }:

{
  services.caddy = {
    enable = true;

    globalConfig = ''
      auto_https disable_redirects
    '';

    virtualHosts = {
      "field.tail1c9f34.ts.net".extraConfig = ''
         redir /git /git/
         handle_path /git/* {
           reverse_proxy localhost:3000
         }


         redir /navi /navi/
         reverse_proxy /navi/* localhost:4533
     '';
    };
  };

  services.tailscale.permitCertUid = "caddy"; # Allowing Caddy to resolve certs for *.ts.net
}
         # handle_path /grafana/* {
         #   reverse_proxy localhost:3050 {
         #     header_up Host {host}
         #     header_up X-Real-IP {remote}
         #     header_up X-Forwarded-Proto {scheme}
         #     header_up X-Forwarded-Prefix /grafana
         #   }
         # }
