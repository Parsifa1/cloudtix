{
  lib,
  stdenvNoCC,
  fetchurl,
}:
stdenvNoCC.mkDerivation rec {
  pname = "fonts";
  version = "056b547";

  src = fetchurl {
    url = "https://github.com/Parsifa1/Fonts/archive/${version}.tar.gz";
    hash = "sha256-o1hs7kyOr5TOY+ZXQX5Ocl3ElRGbFvTReUCKBIFBDQo=";
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
