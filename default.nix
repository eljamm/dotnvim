{
  self ? import ./nix/utils/import-flake.nix { src = ./.; },
  inputs ? self.inputs,
  system ? builtins.currentSystem,
  pkgs ? import inputs.nixpkgs {
    config = { };
    overlays = [ ];
    inherit system;
  },
  lib ? import "${inputs.nixpkgs}/lib",
}:
let
  scope = lib.makeScope pkgs.newScope (sc: {
    inherit
      lib
      pkgs
      self
      system
      inputs
      ;

    # Custom library. Contains helper functions, builders, ...
    devLib = sc.callPackage ./nix/lib.nix { };

    format = sc.callPackage ./nix/formatter.nix { };
    devPkgs = { };
    devShells.default = pkgs.mkShellNoCC {
      packages = [
        sc.format.formatter
      ];
    };

    overlays.default = final: prev: sc.devPkgs;

    flake.perSystem = {
      devShells = sc.devShells;
      formatter = sc.format.formatter;
      packages = sc.devPkgs;
      checks = lib.filterAttrs (_: v: !v.meta.broken or false) sc.flake.perSystem.packages;
      legacyPackages = {
        lib = sc.devLib;
        packages = sc.devPkgs;
      };
    };
    flake.system-agnostic = {
      inherit (sc) overlays;
    };
  });
in
scope // scope.devPkgs
