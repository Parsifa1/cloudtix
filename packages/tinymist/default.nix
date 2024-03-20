{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:
rustPlatform.buildRustPackage rec {
  pname = "tinymist";
  version = "v0.11.1-rc2";

  src = fetchFromGitHub {
    owner = "Myriad-Dreamin";
    repo = pname;
    rev = version;
    hash = "sha256-NZm7bOK00IKfH+Mof1/cNdyRW4nsESBYXGfXG1RzgLs=";
  };

  # cargoHash = "";

  cargoLock = {
    lockFile = ./Cargo.lock;
    outputHashes = {
      # # "typst-0.11.0" = "sha256-UzZ0tbC6Dhn178GQDyLl70WTp3h5WdaBCsEKgLisZ2M=";
      # "reflexo-0.4.2-rc8" = "sha256-wegPTSiYQ7oxqLgQqP4SHGBHPlDpo3hZmQ+shlVALjo=";
      "typst-0.11.0" = "sha256-UzZ0tbC6Dhn178GQDyLl70WTp3h5WdaBCsEKgLisZ2M=";
      # "typst-assets-0.10.0" = "sha256-rfx9XLjAn+eDSGu99FxK19uohKge93PPN4VHQkSLZA8=";
    };
  };

  meta = with lib; {
    description = "Tinymist [ˈtaɪni mɪst] is an integrated language service for Typst [taɪpst]. You can also call it '微霭' [wēi ǎi] in Chinese.";
    homepage = "https://github.com/Myriad-Dreamin/tinymist";
    mainProgram = "tinymist";
    maintainers = with maintainers; [parsifa1];
  };
}
