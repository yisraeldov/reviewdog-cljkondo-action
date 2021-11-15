{ pkgs ? import <nixpkgs>  { } }:
let
  #need to use an old version of nix pkgs so that we have ruby 2.5
  # pkgs20_9 = import
  #   (fetchTarball "https://channels.nixos.org/nixos-20.09/nixexprs.tar.xz") { };
  pkgs_x86 = import <nixpkgs> { localSystem = "x86_64-darwin"; };
in pkgs.mkShell {

  nativeBuildInputs = with pkgs; [
    reviewdog
  ];
}
