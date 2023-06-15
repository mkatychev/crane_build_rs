{
  description = "my-package";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    crane = { url = "github:ipetkov/crane"; inputs.nixpkgs.follows = "nixpkgs"; };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, crane, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        # libs
        pkgs = import nixpkgs { inherit system; };
        inherit (pkgs) lib;
        craneLib = crane.lib.${system};

        myPackage = craneLib.buildPackage {
          src = ./.;
          pname = "my-package";

          buildInputs = [ pkgs.protobuf ];
          doCheck = true;
          cargoExtraArgs = "--package my-package";
        };

      in
      {
        # $ nix flake check
        checks = {
          inherit myPackage ;
        };

        packages = { default = myPackage; };

      });
}
