{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window.dimensions = {
        columns = 150;
        lines = 25;
      };
      cursor.style = {
        shape = "Beam";
        blinking = "On";
      };
      terminal.shell = "nu";
      mouse.hide_when_typing = true;
      font = {
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        size = 14;
      };
    };
    theme = "kanagawa_dragon";
  };
}
