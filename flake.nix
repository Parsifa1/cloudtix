{
  inputs = {
  };
  description = "My personal NUR repository";
  outputs =
    {
      self,
      nixpkgs,
    }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);
    in
    {
      overlay = _final: prev: { cloudtide = self.packages."${prev.system}"; };
      legacyPackages = forAllSystems (
        system:
        import ./default.nix {
          pkgs = import nixpkgs { inherit system; };
        }
      );
      packages = forAllSystems (
        system: nixpkgs.lib.filterAttrs (_: v: nixpkgs.lib.isDerivation v) self.legacyPackages.${system}
      );
      templates = rec {
        devshell = {
          path = ./templates/default;
          description = "nix flake new my-project -t github:parsifa1/nixpkg";
        };
        default = devshell;
      };
    };
}
