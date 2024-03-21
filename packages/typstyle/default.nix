{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  libgit2,
  zlib,
}:
rustPlatform.buildRustPackage rec {
  pname = "typstyle";
  version = "0.11.0";

  src = fetchFromGitHub {
    owner = "Enter-tainer";
    repo = "typstyle";
    rev = "v${version}";
    hash = "sha256-nzIo33OuGhTWL2zmxUsT3O8lm+Cq1ydft4s7aLaNgg8=";
  };

  cargoHash = "sha256-keBNz9ItE91CxPulgpfOMPs97hfFij96JmKGaVnio4g=";

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    libgit2
    zlib
  ];

  meta = with lib; {
    description = "Format your typst source code";
    homepage = "https://github.com/Enter-tainer/typstyle";
    license = licenses.asl20;
    maintainers = with maintainers; [parsifa1];
    mainProgram = "typstyle";
  };
}
