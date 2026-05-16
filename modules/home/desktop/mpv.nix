{ inputs, ... }:
{
  programs.mpv = {
    enable = true;
    # Using stable build to avoid compiling rusty_v8 from unstable
    package = inputs.nixpkgs.legacyPackages.x86_64-linux.mpv;
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
