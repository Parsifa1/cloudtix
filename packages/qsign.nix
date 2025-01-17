{ pkgs }:
let
  pname = "qsign";
  version = "27b450dd7105b0acffbc371367cedb111b809052";
in
pkgs.stdenv.mkDerivation {
  inherit pname version;
  src = fetchGit {
    url = "https://github.com/Parsifa1/${pname}.git";
    ref = "master";
    rev = version;
  };
  installPhase = ''
    cp -r $src $out
  '';
  preferLocalBuild = true;
  meta.dontBuild = true;
}
