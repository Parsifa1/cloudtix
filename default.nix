{pkgs}: {
  win32yank = pkgs.callPackage ./packages/win32yank.nix {};
  typstyle = pkgs.callPackage ./packages/typstyle {};
  fonts = pkgs.callPackage ./packages/fonts.nix {};
  tinymist = pkgs.callPackage ./packages/tinymist {};
  onnxruntime = pkgs.callPackage ./packages/onnxruntime.nix {};
  # delance = pkgs.callPackage ./packages/delance.nix  {};
}
