{
  stdenvNoCC,
  lib,
  fetchFromGitHub,
  makeWrapper,
  wget,
}:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "distrobox";
  version = "1.8.1.2";

  src = fetchFromGitHub {
    owner = "89luca89";
    repo = "distrobox";
    rev = finalAttrs.version;
    hash = "sha256-wTu+8SQZaf8TKkjyvKqTvIWnCZTiPnozybTu5uKXEJk=";
  };

  dontConfigure = true;
  dontBuild = true;

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    runHook preInstall

    ./install -P $out

    runHook postInstall
  '';

  # https://github.com/89luca89/distrobox/issues/407
  postFixup = ''
    wrapProgram "$out/bin/distrobox-generate-entry" \
      --prefix PATH ":" ${lib.makeBinPath [ wget ]}

    mkdir -p $out/share/distrobox
    echo 'container_additional_volumes="/nix:/nix /etc/static/profiles/per-user:/etc/profiles/per-user:ro /run/current-system/sw/bin:/run/current-system/sw/bin:ro"' > $out/share/distrobox/distrobox.conf
  '';

  meta = with lib; {
    description = "Wrapper around podman or docker to create and start containers";
    longDescription = ''
      Use any linux distribution inside your terminal. Enable both backward and
      forward compatibility with software and freedom to use whatever distribution
      you’re more comfortable with
    '';
    homepage = "https://distrobox.it/";
    license = licenses.gpl3Only;
    don = stdenvNoCC.hostPlatform.isDarwin;
    platforms = platforms.unix;
  };
})
