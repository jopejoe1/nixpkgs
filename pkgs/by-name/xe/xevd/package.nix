{
  lib,
  fetchFromGitHub,
  stdenv,
  gitUpdater,
  testers,
  cmake,
  fetchpatch2,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "xevd";
  version = "0.5.0";

  src = fetchFromGitHub {
    owner = "mpeg5";
    repo = "xevd";
    rev = "v${finalAttrs.version}";
    hash = "sha256-Dc2V77t+DrZo9252FAL0eczrmikrseU02ob2RLBdVvU=";
  };

  patches = [
    (fetchpatch2 {
      name = "fix_compiling_on_clang";
      url = "https://github.com/mpeg5/xevd/commit/41db32ca3283eb8ac175465edb6b4b3d78e8b9c9.patch";
      hash = "sha256-SmamhxEQGvAYNbzwnle8zeAFfmX/DPRh3wrHrd44AYc=";
    })
    (fetchpatch2 {
      name = "fix_compiling_on_clang_2";
      url = "https://github.com/mpeg5/xevd/commit/daf25895eb2f0293f3efead45fbb8213f963c866.patch";
      hash = "sha256-uQ4iW5m5F+7CYTix5TbLt2l63HRuu7UrSQcG22NgbUY=";
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
    ln $dev/include/xevd/* $dev/include/
  '';

  outputs = [
    "out"
    "lib"
    "dev"
  ];

  env.NIX_CFLAGS_COMPILE = toString [
    (lib.optionalString stdenv.hostPlatform.isLinux "-lm")
  ];

  passthru.updateScript = gitUpdater { rev-prefix = "v"; };
  passthru.tests.pkg-config = testers.testMetaPkgConfig finalAttrs.finalPackage;

  meta = {
    homepage = "https://github.com/mpeg5/xevd";
    description = "eXtra-fast Essential Video Decoder, MPEG-5 EVC";
    license = lib.licenses.bsd3;
    mainProgram = "xevd_app";
    pkgConfigModules = [ "xevd" ];
    maintainers = with lib.maintainers; [ jopejoe1 ];
    platforms = lib.platforms.all;
  };
})
