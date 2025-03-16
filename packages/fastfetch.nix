{ pkgs }:

pkgs.fastfetch.overrideAttrs (oldAttrs: {
  buildInputs =
    oldAttrs.buildInputs
    ++ (with pkgs; [
      directx-headers
    ]);

  cmakeFlags = oldAttrs.cmakeFlags ++ [
    (pkgs.lib.cmakeBool "ENABLE_DIRECTX_HEADERS" true)
  ];
})
