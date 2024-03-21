{ lib, stdenvNoCC, fetchurl }:

stdenvNoCC.mkDerivation rec {
  pname = "IosevkaCloudtide";
  version = "master";

  src = fetchurl {
    url = "https://github.com/Parsifa1/IosevkaCloudtide/archive/refs/heads/${version}.tar.gz";
    hash = "sha256-+OnS4ewCrnqIOH3zyo0TDdto7W+fsxmw7VuVRFs2XYo=";
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
