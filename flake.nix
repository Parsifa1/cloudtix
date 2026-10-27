{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    herdr = {
      url = "github:Parsifa1/herdr/feat/quic-endpoint";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  description = "My personal NUR repository";
  outputs =
    {
      self,
      nixpkgs,
      herdr,
    }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);
    in
    {
      overlay =
        _final: prev:
        let
          system = prev.stdenv.hostPlatform.system;
        in
        {
          cloudtide = self.packages.${system};
          fastfetch = self.packages.${system}.fastfetch;
          herdr = self.packages.${system}.herdr;
        };
      legacyPackages = forAllSystems (
        system:
        import ./default.nix {
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
        }
      );
      packages = forAllSystems (
        system:
        let
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
        in
        let
          legacy = nixpkgs.lib.filterAttrs (
            _: v:
            nixpkgs.lib.isDerivation v
            && nixpkgs.lib.meta.availableOn pkgs.stdenv.hostPlatform v
            && !(v.meta.dontBuild or false)
          ) self.legacyPackages.${system};
        in
        legacy
        // nixpkgs.lib.optionalAttrs (herdr.packages ? ${system}.herdr) {
          herdr = herdr.packages.${system}.herdr;
        }
      );
      checks = self.packages;
      templates = rec {
        devshell = {
          path = ./templates/default;
          description = "nix flake new my-project -t github:parsifa1/nixpkg";
        };
        default = devshell;
      };
    };
}
