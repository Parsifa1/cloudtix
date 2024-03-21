{ lib, stdenvNoCC, fetchurl }:

stdenvNoCC.mkDerivation rec {
  pname = "IosevkaCloudtide";
  version = "master";

  src = fetchurl {
    url = "https://github.com/Parsifa1/IosevkaCloudtide/archive/refs/heads/${version}.zip";
    hash = "sha256-3tjXUBW5wWSVbDFi02xSr9Ua4+ONwxJwN+rchzZry/s=";
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/fonts/truetype
    mv *.ttf $out/share/fonts/truetype

    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://github.com/Parsifa1/IosevkaCloudtide";
    description = "test";
    license = licenses.ofl;
    platforms = platforms.all;
    maintainers = with maintainers; [ parsifa1 ];
  };
}
