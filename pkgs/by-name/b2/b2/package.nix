{
  lib,
  stdenv,
  bison,
  fetchFromGitHub,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "b2";
  version = "5.2.1";

  src = fetchFromGitHub {
    owner = "bfgroup";
    repo = "b2";
    rev = "refs/tags/${finalAttrs.version}";
    hash = "sha256-R8FtMPeaiHveeIMPrq36Kdjj1NkNq+pXkFVi06RXoAQ=";
  };

  patchPhase = ''
    patchShebangs --build src/engine/build.sh
  '';

  nativeBuildInputs = [
    bison
  ];

  buildPhase = ''
    runHook preBuild

    ./bootstrap.sh

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    ./b2 ${lib.optionalString (stdenv.cc.isClang) "toolset=clang "}install --prefix="$out"

    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://www.bfgroup.xyz/b2/";
    license = lib.licenses.boost;
    platforms = platforms.unix;
    maintainers = with maintainers; [ jopejoe1 ];
  };
})
