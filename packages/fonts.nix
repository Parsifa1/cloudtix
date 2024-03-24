{ lib, stdenvNoCC, fetchurl }:

stdenvNoCC.mkDerivation rec {
  pname = "fonts";
  version = "master";

  src = fetchurl {
    url = "https://github.com/Parsifa1/Fonts/archive/refs/heads/${version}.tar.gz";
    hash = "sha256-lebL8iGvddasqez5hGbr2bc05PCni0oQ9Du20IE7jog=";
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/fonts/truetype
    mv *.ttf $out/share/fonts/truetype

    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://github.com/Parsifa1/Fonts";
    description = "test";
    license = licenses.ofl;
    platforms = platforms.all;
    maintainers = with maintainers; [ parsifa1 ];
  };
}
