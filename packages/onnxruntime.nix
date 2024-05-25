{
  fetchurl,
  lib,
  stdenvNoCC,
  makeWrapper,
}:
stdenvNoCC.mkDerivation rec {
  pname = "onnxruntime";
  version = "1.8.1";

  src = fetchurl {
    url = "https://github.com/microsoft/onnxruntime/releases/download/v${version}/${pname}-linux-x64-${version}.tgz";
    sha256 = "sha256-bTW9Pc3rvH+c8VIlDDEtAXyA3sajVyY5Aqr6+SxaMF4=";
  };

  nativeBuildInputs = [makeWrapper];

  installPhase = ''
    cp -r ./* $out/
  '';

  meta = with lib; {
    description = "ONNX Runtime";
    homepage = "https://github.com/microsoft/onnxruntime";
    license = licenses.mit;
    maintainers = [maintainers.none];
  };
}
