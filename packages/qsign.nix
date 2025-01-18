{ pkgs }:
let
  pname = "qsign";
  version = "3bb125e7401634bd4e2a2dfee5436bc36ff1c33e";
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
