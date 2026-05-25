{ ... }:
{
  programs.zellij = {
    enable = true;
    extraConfig = ''
      default_shell "nu"    
      session_serialization false
      show_startup_tips false
      keybinds {
      scroll {
        unbind "e"
      }
    }
    '';
    settings = {
      simplified_ui = false;
      default_layout = "default";
      # default_layout = "compact";
      pane_frames = false;
      mouse_mode = true;
      copy_on_select = true;
      theme = "monokai";
      themes.monokai = {
        fg     = "#f8f8f2";
        bg     = "#272822";
        black  = "#272822";
        red    = "#f92672";
        green  = "#a6e22e";
        yellow = "#f4bf75";
        blue   = "#66d9ef";
        magenta = "#ae81ff";
        cyan   = "#a1efe4";
        white  = "#f8f8f2";
        orange = "#fd971f";
      };
    };
  };
}
