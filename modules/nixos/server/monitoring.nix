{ ... }: {
  services.prometheus = {
    enable = true;
    exporters = {
      node.enable = true;
      zfs.enable = true;
    };
    scrapeConfigs = [{
      job_name = "field";
      static_configs = [{ targets = ["localhost:9100"]; }];
    }];
  };
  services.grafana = {
    enable = true;
    settings.server = {
      # domain = "field.tail1c9f34.ts.net";
      # root_url = "https://field.tail1c9f34.ts.net/grafana/";
      # serve_from_sub_path = true;
      http_addr = "127.0.0.1";
      http_port = 3050;
    };
  };
}
