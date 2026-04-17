{ pkgs, ... }:

{
  home.username = "lispectre";
  home.homeDirectory = "/home/lispectre";

  imports = [
    ../../modules/home/development/helix.nix
    ../../modules/home/development/alacritty.nix
    ../../modules/home/development/nushell.nix
    ../../modules/home/development/git.nix

    ../../modules/home/internet/brave.nix
    ../../modules/home/multimedia/mpv.nix
  ];

  home.packages = with pkgs; [
    # Utils
    fastfetch
    yazi
    zip
    xz
    unzip
    p7zip
    ripgrep
    jq
    eza
    fzf
    hyperfine
    uutils-coreutils
    btop    
    
    # Dev
    gcc
    nixd
    jujutsu
    
    # Gaming
    steam
    vesktop

    # Fonts I use (probably to be moved elsewhere)
    nerd-fonts.jetbrains-mono
  ];

  home.stateVersion = "25.11";
}
