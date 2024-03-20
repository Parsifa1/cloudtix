{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  libgit2,
  git,
  openssl,
  zlib,
  stdenv,
  darwin,
}: let
  gitRev = "13e35624245b2c84d005eec2e0a2a70c30b84a3e"; # 示例 Git 版本哈希
  gitDescribe = "v0.11.1-rc2"; # 示例 Git 描述，通常是最近的标签
in
  rustPlatform.buildRustPackage rec {
    pname = "tinymist";
    version = "0.11.1-rc2";

    src = fetchFromGitHub {
      owner = "Myriad-Dreamin";
      repo = "tinymist";
      rev = "v${version}";
      hash = "sha256-iBisN3zpJy9sU2H/WVEH8i6q3xCl4kVpoGoNxIUEnt4=";
    };

    env.VERGEN_GIT_SHA = gitRev;
    env.VERGEN_GIT_DESCRIBE = gitDescribe;
    doCheck = false;

    cargoLock = {
      lockFile = ./Cargo.lock;
      outputHashes = {
        "typst-0.11.0" = "sha256-UzZ0tbC6Dhn178GQDyLl70WTp3h5WdaBCsEKgLisZ2M=";
      };
    };

    nativeBuildInputs = [
      pkg-config
      git
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
      license = licenses.asl20;
      maintainers = with maintainers; [];
      mainProgram = "tinymist";
    };
  }
