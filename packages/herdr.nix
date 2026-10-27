{
  pkgs,
  fetchFromGitHub,
}:
let
  src = fetchFromGitHub {
    owner = "Parsifa1";
    repo = "herdr";
    rev = "234402c993ba6aea49d30cfecc76f18d841deb42";
    hash = "sha256-FT3w17asg4r889kmk1EJFFdFcNzyUjxpLSiWiB2q6g0=";
  };
in
pkgs.callPackage "${src}/nix/package.nix" { }
