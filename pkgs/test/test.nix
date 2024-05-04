let
  pkgs = import <nixpkgs> { };
in
  pkgs.stdenv.mkDerivation {
    name = "hello-nix";

    src = ./src;

    buildPhase = ''
      $CC simple.c -o hello-nix
    '';

    installPhase = ''
      mkdir -p $out/bin
      cp hello-nix  $out/bin/hello-nix
    '';
  }