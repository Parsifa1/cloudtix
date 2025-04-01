{
  pkgs,
  fetchurl,
}:
pkgs.stdenv.mkDerivation rec {
  pname = "awrit";
  version = "v1.0.1";

  src = fetchurl {
    url = "https://github.com/Parsifa1/awrit/releases/download/${version}/awrit-mac-arm64.tar.xz";
    sha256 = "sha256-WYrPWaqjY+6qARojBbpTIxwrntvxLYESV0QIWBJGFNk=";
  };
  unpackPhase = ''
    tar -xvJf $src
  '';

  buildInputs = [ pkgs.gnused ];

  installPhase = ''
    mkdir -p $out
    cp -r ./* $out/
    outPath=$out/lib/awrit

    sed -i 's|^AWRIT_LIB_PREFIX="[^"]*"|AWRIT_LIB_PREFIX="'"$outPath"'"|' $out/bin/awrit
    # rm $out/bin/*
    # ln -s $out/lib/awrit/awrit.app/Contents/Macos/awrit $out/bin/awrit
  '';

  meta = {
    description = "Actual Web Rendering in Terminal";
    homepage = "https://github.com/Parsifa1/awrit";
    dontBuild = !pkgs.stdenv.hostPlatform.isDarwin;
  };
}
