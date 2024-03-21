{pkgs}: {
  win32yank = pkgs.callPackage ./packages/win32yank.nix {};
  tinymist = pkgs.callPackage ./packages/tinymist {};
  typstyle = pkgs.callPackage ./packages/typstyle {};
  IosevkaCloudtide = pkgs.callPackage ./packages/IosevkaCloudtide.nix {};
  # delance = pkgs.callPackage ./packages/delance.nix  {};
}
