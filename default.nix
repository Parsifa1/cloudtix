{
  pkgs ? import <nixpkgs> { },
}:
# packagesFromDirectoryRecursive {
#   callPackage = pkgs.callPackage;
#   directory = ./my-packages;
# }
{

  fonts = pkgs.callPackage ./packages/fonts.nix { };
  awrit = pkgs.callPackage ./packages/awrit.nix { };
  qsign = pkgs.callPackage ./packages/qsign.nix { };
  win32yank = pkgs.callPackage ./packages/win32yank.nix { };
  fastfetch = pkgs.callPackage ./packages/fastfetch.nix { };
  distrobox = pkgs.callPackage ./packages/distrobox.nix { };
  onnxruntime = pkgs.callPackage ./packages/onnxruntime.nix { };
  verilator5008 = pkgs.callPackage ./packages/velilator.nix { };
}
