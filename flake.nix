{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    treefmt-nix.url = "github:numtide/treefmt-nix";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";
    git-hooks.url = "github:fricklerhandwerk/git-hooks";
    git-hooks.flake = false;
  };

  # construct flake from ./default.nix
  outputs =
    { self, ... }@inputs:
    let
      inherit (inputs.flake-utils.lib) eachDefaultSystem eachDefaultSystemPassThrough;
      importDefault = arg: (system: (import ./. { inherit self inputs system; }).flake.${arg} or { });
      systemAgnosticFlake = eachDefaultSystemPassThrough (importDefault "systemAgnostic");
      perSystemFlake = eachDefaultSystem (importDefault "perSystem");
    in
    systemAgnosticFlake // perSystemFlake;
}
