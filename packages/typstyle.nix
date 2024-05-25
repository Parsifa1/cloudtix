{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, libgit2
, zlib
}:

rustPlatform.buildRustPackage rec {
  pname = "typstyle";
  version = "unstable-2024-03-21";

  src = fetchFromGitHub {
    owner = "Enter-tainer";
    repo = "typstyle";
    rev = "6947d6b68904d31aee40fd6c38326ea694449519";
    hash = "sha256-azN9uNUGo9ycRlwQfUTLNC9QgSA49swviJNx2gv7CSs=";
  };

  cargoHash = "sha256-CTwUpH45XqYtyRUsQ+Uuj38iZnCkyNQLcBSFhIDvxD0=";

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
    maintainers = with maintainers; [ ];
    mainProgram = "typstyle";
  };
}
