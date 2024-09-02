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
    hash = "sha256-b/CGSpgTH5NwKhJbFLUPAiB34HZW2mEao3axnB0X3i4=";
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
    maintainers = with maintainers; [parsifa1];
  };
}
