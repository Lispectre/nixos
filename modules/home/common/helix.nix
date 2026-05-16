{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    settings = {
      theme = "gruvbox-material";
      editor = {
        line-number = "relative";
        bufferline = "multiple";
        cursorline = true;
        shell = [ "nu" "--commands" ];
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
      };
    };
  };
}
