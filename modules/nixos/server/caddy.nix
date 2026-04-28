{ ... }:

{
  services.caddy = {
    enable = true;
    virtualHosts = {
      "git.ts.net".extraConfig = ''
        reverse_proxy localhost:3000
      '';
      #"navidrome.ts.net".extraConfig = ''
      #  reverse_proxy localhost:4533
      #'';
    };
  };
}
