{
  lib,
  fetchFromGitHub,
  gitUpdater,
  stdenv,
  cmake,
  fetchpatch2,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "xeve";
  version = "0.5.0";

  src = fetchFromGitHub {
    owner = "mpeg5";
    repo = "xeve";
    rev = "v${finalAttrs.version}";
    hash = "sha256-8jXntm/yFme9ZPImdW54jAr11hEsU1K+N5/7RLmITPs=";
  };

  patches = [
    (fetchpatch2 {
      name = "fix_compiling_on_clang";
      url = "https://github.com/mpeg5/xeve/commit/3bcbe24d9b0a58b559998b57d1c6af825d2d59c8.patch";
      hash = "sha256-g4cPeoT77YbMXZLET9u9WwJgmW2JaXuVUoAqJ0dJwng=";
    })
  ];

  postPatch = ''
    echo v$version > version.txt
  '';

  cmakeFlags = [
    (lib.cmakeBool "ARM" stdenv.hostPlatform.isAarch)
  ];

  nativeBuildInputs = [ cmake ];

  postInstall = ''
    ln $dev/include/xeve/* $dev/include/
  '';

  env.NIX_CFLAGS_COMPILE = toString [ "-lm" ];

  outputs = [
    "out"
    "lib"
    "dev"
  ];

  passthru.updateScript = gitUpdater { rev-prefix = "v"; };

  meta = {
    homepage = "https://github.com/mpeg5/xeve";
    description = "eXtra-fast Essential Video Encoder, MPEG-5 EVC";
    license = lib.licenses.bsd3;
    mainProgram = "xeve_app";
    maintainers = with lib.maintainers; [ jopejoe1 ];
    platforms = lib.platforms.all;
  };
})
