{ pkgs, ... }: {
  programs.nushell = {
    enable = true;
    settings = {
      show_banner = false;
      buffer_editor = "hx";
    };
  };
}
