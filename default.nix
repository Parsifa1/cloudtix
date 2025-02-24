{
  pkgs ? import <nixpkgs> { },
}:
{
  win32yank = pkgs.callPackage ./packages/win32yank.nix { };
  fonts = pkgs.callPackage ./packages/fonts.nix { };
  awrit = pkgs.callPackage ./packages/awrit.nix { };
  onnxruntime = pkgs.callPackage ./packages/onnxruntime.nix { };
  verilator5008 = pkgs.callPackage ./packages/velilator.nix { };
  qsign = pkgs.callPackage ./packages/qsign.nix { };
  tree-sitter = pkgs.callPackage ./packages/treesitter.nix { };
}
