{
  lib,
  stdenvNoCC,
  fetchurl,
}:
stdenvNoCC.mkDerivation rec {
  pname = "fonts";
  version = "d4267b2";

  src = fetchurl {
    url = "https://github.com/Parsifa1/Fonts/archive/${version}.tar.gz";
    hash = "sha256-bj4hjCHL6hs4BivLQVXBtJy5SW5SnoCo5jBLfXMa4ic=";
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/fonts/truetype
    mv *.ttf $out/share/fonts/truetype

    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://github.com/Parsifa1/Fonts";
    description = "my fonts";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
