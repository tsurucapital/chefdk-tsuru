{
  description = "Chef DK client environment used by tsurucapital";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/master";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, flake-utils, flake-compat }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      rec {
        legacyPackages = pkgs;
        packages = flake-utils.lib.flattenTree {
          chefdk-tsuru = pkgs.callPackage ./chefdk { };
        };
        defaultPackage = packages.chefdk-tsuru;
        apps.chefdk-tsuru = flake-utils.lib.mkApp {
          drv = packages.chefdk-tsuru;
        };
        devShell = pkgs.mkShell {
          buildInputs = [
            pkgs.bundix
          ];
        };
      });
}
