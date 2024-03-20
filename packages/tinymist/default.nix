{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:
rustPlatform.buildRustPackage {
  pname = "Tinymist";
  version = "0.11.0";

  src = fetchFromGitHub {
    owner = "Myriad-Dreamin";
    repo = "tinymist";
    rev = "a3948df5da08a18968fe8ec7efcebb63741054d7";
    hash = "sha256-NZm7bOK00IKfH+Mof1/cNdyRW4nsESBYXGfXG1RzgLs=";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
    outputHashes = {
      # "typst-assets-4d1211a" = "";
      "typst-0.11.0" = "sha256-33333333333333333333333333333333333333333333";
      # "reflexo-0.4.2-rc8" = "sha256-22222222222222222222222222222222222222222222";
      # "typst-assets-0.10.0" = "sha256-11111111111111111111111111111111111111111111";
      # "typst.ts-2fc877d" = "sha256-00000000000000000000000000000000000000000000";
    };
  };

  meta = with lib; {
    description = "Tinymist [ˈtaɪni mɪst] is an integrated language service for Typst [taɪpst]. You can also call it '微霭' [wēi ǎi] in Chinese.";
    homepage = "https://github.com/Myriad-Dreamin/tinymist";
    mainProgram = "tinymist";
    # changelog = "https://github.com/Myriad-Dreamin/tinymist/releases/tag/${src.rev}";
    maintainers = with maintainers; [parsifa1];
  };
}
