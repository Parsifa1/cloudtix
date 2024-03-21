{ lib, stdenvNoCC, fetchurl }:

stdenvNoCC.mkDerivation rec {
  pname = "IosevkaCloudtide";
  version = "main";

  src = fetchurl {
    url = "https://github.com/Parsifa1/IosevkaCloudtide/tree/master";
    hash = "sha256-9crFUfj1mOXg4gD607jL2eHq8wlq/yEi5sgzKJ5YavM=";
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
