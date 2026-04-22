{ pkgs, ... }:
{
  home.username = "lispectre";
  home.homeDirectory = "/home/lispectre";
  imports = [
    ../../modules/home/common/helix.nix
    ../../modules/home/common/nushell.nix
    ../../modules/home/common/git.nix
  ];
  home.packages = with pkgs; [
    ripgrep
    jq
    eza
    fzf
    btop
    uutils-coreutils
    nixd
    nil
    jujutsu
  ];
  home.stateVersion = "25.11";
}
