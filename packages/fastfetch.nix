{ pkgs }:

let
  unwrapped = pkgs.fastfetch-unwrapped.overrideAttrs (oldAttrs: {
    buildInputs = oldAttrs.buildInputs ++ [ pkgs.directx-headers ];
    cmakeFlags = oldAttrs.cmakeFlags ++ [
      (pkgs.lib.cmakeBool "ENABLE_DIRECTX_HEADERS" true)
    ];
  });
in
pkgs.fastfetch.override {
  fastfetch-unwrapped = unwrapped;
  extraRuntimeDependencies = [ pkgs.directx-headers ];
}
