{
  fetchurl,
  lib,
  stdenvNoCC,
}:
stdenvNoCC.mkDerivation rec {
  pname = "onnxruntime";
  version = "1.8.1";

  src = fetchurl {
    url = "https://github.com/microsoft/onnxruntime/releases/download/v${version}/${pname}-linux-x64-${version}.tgz";
    sha256 = "sha256-y2i6PuPrgZq6dNaBXKObmgYD42Ng77g5jy4niy/2bJ0=";
  };

  # nativeBuildInputs = [makeWrapper];

  installPhase = ''
    mkdir -p $out
    cp -r ./* $out/
  '';

  meta = with lib; {
    description = "ONNX Runtime";
    homepage = "https://github.com/microsoft/onnxruntime";
    license = licenses.mit;
  };
}
