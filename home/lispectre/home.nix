{ pkgs, ... }:

{
  home.username = "lispectre";
  home.homeDirectory = "/home/lispectre";

  imports = [
    ../../modules/home/common/helix.nix
    ../../modules/home/common/nushell.nix
    ../../modules/home/common/git.nix

    ../../modules/home/desktop/brave.nix
    ../../modules/home/desktop/mpv.nix
    ../../modules/home/desktop/alacritty.nix
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
    typst
    typstyle
    
    # Dev
    zed-editor
    vscode # TODO: configure as home-manager module    
    gcc
    nixd
    nil
    jujutsu
    
    # Gaming
    steam
    vesktop
    mangohud

    # Internet
    qbittorrent

    # Misc.
    calibre

    # Fonts I use (probably to be moved elsewhere)
    nerd-fonts.jetbrains-mono
    nerd-fonts.mononoki
  ];

  home.stateVersion = "25.11";
}
