{
  lib,
  pkgs,
  rustPlatform,
  fetchFromGitHub,
}: let
  gitRev = "13e35624245b2c84d005eec2e0a2a70c30b84a3e"; # 示例 Git 版本哈希
  gitDescribe = "v0.11.1-rc2"; # 示例 Git 描述，通常是最近的标签
in
  rustPlatform.buildRustPackage rec {
    pname = "tinymist";
    version = "v0.11.1-rc2";

    auditable = false;
    src = fetchFromGitHub {
      repo = pname;
      rev = version;
      owner = "Myriad-Dreamin";
      hash = "sha256-iBisN3zpJy9sU2H/WVEH8i6q3xCl4kVpoGoNxIUEnt4=";
    };

    nativeBuildInputs = [pkgs.git];

    env.VERGEN_GIT_SHA = gitRev;
    env.VERGEN_GIT_DESCRIBE = gitDescribe;

    cargoLock = {
      lockFile = ./Cargo.lock;
      outputHashes = {
        "typst-0.11.0" = "sha256-UzZ0tbC6Dhn178GQDyLl70WTp3h5WdaBCsEKgLisZ2M=";
      };
    };

    meta = with lib; {
      description = "Tinymist [ˈtaɪni mɪst] is an integrated language service for Typst [taɪpst]. You can also call it '微霭' [wēi ǎi] in Chinese.";
      homepage = "https://github.com/Myriad-Dreamin/tinymist";
      mainProgram = "tinymist";
      maintainers = with maintainers; [parsifa1];
    };
  }
