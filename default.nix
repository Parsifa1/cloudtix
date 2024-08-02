{pkgs}: {
  win32yank = pkgs.callPackage ./packages/win32yank.nix {};
  fonts = pkgs.callPackage ./packages/fonts.nix {};
  onnxruntime = pkgs.callPackage ./packages/onnxruntime.nix {};
}
