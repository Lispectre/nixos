{ inputs, pkgs, ... }:

let unstablePkgs = import inputs.nixpkgs-unstable {
  inherit (pkgs) system;
  config.allowUnfree = true;
};   
in {
  home.username = "lispectre";
  home.homeDirectory = "/home/lispectre";
  imports = [
    ../../modules/home/common/helix.nix
    ../../modules/home/common/nushell.nix
    ../../modules/home/common/git.nix
    ../../modules/home/common/nh.nix
  ];
  home.packages = with pkgs; [
    ripgrep
    unstablePkgs.beets
    unzip
    p7zip
    jq
    eza
    fzf
    btop
    uutils-coreutils
    nixd
    nil
    jujutsu
    sops
    age
  ];
  home.stateVersion = "25.11";
}
