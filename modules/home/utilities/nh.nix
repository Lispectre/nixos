{ ... }:
{
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--delete-older-than 14d";
    };
  };
}
