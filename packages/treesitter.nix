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
  pname = "tree-sitter";
  version = "0.25.2";

  src = fetchFromGitHub {
    owner = "tree-sitter";
    repo = "tree-sitter";
    rev = "v${version}";
    hash = "sha256-KBklMtR/vO/YxZR5LMSKBqVw0omIbUFsIrDk8nMzzK4=";
  };

  cargoHash = "sha256-hNyYl9FVqWM6dxyYrGfXkMDiVgIrG1AX3KoW/GPY1HE=";

  nativeBuildInputs = [
    pkg-config
    rustPlatform.bindgenHook
  ];
  doCheck = false;

  buildInputs = [
    libgit2
    openssl
    zlib
  ]
  ++ lib.optionals stdenv.isDarwin [
    darwin.apple_sdk.frameworks.CoreFoundation
    darwin.apple_sdk.frameworks.CoreServices
    darwin.apple_sdk.frameworks.Security
  ];

  meta = {
    description = "";
    homepage = "https://github.com/tree-sitter/tree-sitter";
    license = lib.licenses.mit;
    mainProgram = "tree-sitter";
  };
}
