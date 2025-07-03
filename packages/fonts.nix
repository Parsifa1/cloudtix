{
  lib,
  stdenvNoCC,
  fetchurl,
}:
stdenvNoCC.mkDerivation rec {
  pname = "fonts";
  version = "824f42f";

  src = fetchurl {
    url = "https://github.com/Parsifa1/Fonts/archive/${version}.tar.gz";
    hash = "sha256-iPEDZL9FRP1fXqIo1APQPYtR6FQg0WIfFy/288OnQw0=";
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
