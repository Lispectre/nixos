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
    ../../modules/home/desktop/zellij.nix
    ../../modules/home/desktop/zed.nix
  ];

  home.packages = with pkgs; [
    # Utils
    fastfetch
    yazi
    zip
    xz
    unzip
    p7zip
    unrar
    ripgrep
    jq
    eza
    fzf
    hyperfine
    uutils-coreutils
    btop    
    typst
    typstyle
    sops
    age
    
    # Dev
    rust-analyzer
    cargo
    rustc
    gcc
    nixd
    nil
    jujutsu
    zig
    zls
    
    # Gaming
    steam
    vesktop
    mangohud
    protonup-ng
    pcsx2

    # Internet
    qbittorrent
    nicotine-plus

    # Misc.
    calibre
    libreoffice
    obs-studio

    # Fonts I use (probably to be moved elsewhere)
    nerd-fonts.jetbrains-mono
    nerd-fonts.monaspace
    nerd-fonts.ubuntu-mono
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
  ];

  home.stateVersion = "25.11";
}
