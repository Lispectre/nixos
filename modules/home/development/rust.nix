{ pkgs, inputs, ... }:
let
  fenix = inputs.fenix;
in {
  nixpkgs.overlays = [ fenix.overlays.default ];

  environment.systemPackages = [
    (pkgs.fenix.complete.withComponents [
      "cargo"
      "clippy"
      "rust-src"
      "rustc"
      "rustfmt"
    ])
    pkgs.rust-rust-analyzer-nightly
  ];

  environment.variables = {
    CARGO_NET_GIT_FETCH_WITH_CLI = "true";
  };
}
