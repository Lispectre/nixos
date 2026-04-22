{ ... }:
{
  programs.mpv = {
    enable = true;
    config = {
      vo = "gpu-next";
      hwdec = "auto";
      scale = "ewa_lanczossharp";
      cscale = "ewa_lanczossharp";
      dscale = "mitchell";
      scale-antiring = 0.6;
      cscale-antiring = 0.6;
      deband = "yes";
      dither-depth = "auto";
    };
  };
}
