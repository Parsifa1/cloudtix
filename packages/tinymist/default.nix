{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  libgit2,
  openssl,
  zlib,
  stdenv,
  darwin,
}:
rustPlatform.buildRustPackage rec {
  pname = "tinymist";
  version = "0.11.3";

  src = fetchFromGitHub {
    owner = "Myriad-Dreamin";
    repo = "tinymist";
    rev = "v${version}";
    hash = "sha256-0wVCOFWA6PX1UHe3rGWbCW4zSJHvGrW9OiFcH2wvayA=";
  };

  doCheck = false;

  cargoLock = {
    lockFile = ./Cargo.lock;
    outputHashes = {
      "typst-0.11.0" = "sha256-UzZ0tbC6Dhn178GQDyLl70WTp3h5WdaBCsEKgLisZ2M=";
      "typst-syntax-0.7.0" = "sha256-yrtOmlFAKOqAmhCP7n0HQCOQpU3DWyms5foCdUb9QTg=";
      "typstfmt_lib-0.2.7" = "sha256-LBYsTCjZ+U+lgd7Z3H1sBcWwseoHsuepPd66bWgfvhI=";
    };
  };

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs =
    [
      libgit2
      openssl
      zlib
    ]
    ++ lib.optionals stdenv.isDarwin [
      darwin.apple_sdk.frameworks.CoreFoundation
      darwin.apple_sdk.frameworks.CoreServices
      darwin.apple_sdk.frameworks.Security
    ];

  meta = with lib; {
    description = "";
    homepage = "https://github.com/Myriad-Dreamin/tinymist";
    changelog = "https://github.com/Myriad-Dreamin/tinymist/blob/${src.rev}/CHANGELOG.md";
    license = licenses.asl20;
    maintainers = with maintainers; [parsifa1];
    mainProgram = "tinymist";
  };
}
