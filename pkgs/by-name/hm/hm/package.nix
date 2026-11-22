{
  lib,
  stdenv,
  fetchFromGitLab,
  gitUpdater,
  cmake,
  llvmPackages,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "hm";
  version = "20.0";

  src = fetchFromGitLab {
    domain = "vcgit.hhi.fraunhofer.de";
    owner = "jvet";
    repo = "HM";
    tag = "HM-${finalAttrs.version}";
    hash = "sha256-BMpXrQJnt6ISHvtkPlF3bQMLpNEUZi5h9+V3wg/GXFo=";
  };

  postPatch = ''
    substituteInPlace CMakeLists.txt \
      --replace-fail "-msse4.1" ""
  '';

  cmakeFlags = [
    (lib.cmakeBool "HIGH_BITDEPTH" true)
    (lib.cmakeBool "ENABLE_EXT" true)
    (lib.cmakeBool "ENABLE_SVC" true)
  ];

  nativeBuildInputs = [
    cmake
  ];

  buildInputs = [
    llvmPackages.openmp
  ];

  installPhase = ''
    runHook preInstall

    install -Dm 755 -t $out/bin ../bin/umake/*/*/release/*

    runHook postInstall
  '';

  strictDeps = true;

  passthru = {
    updateScript = gitUpdater {
      rev-prefix = "HM-";
      ignoredVersions = "rc";
    };
  };

  meta = {
    description = "Reference software for HEVC";
    homepage = "https://vcgit.hhi.fraunhofer.de/jvet/HM";
    license = lib.licenses.bsd3;
    platforms = lib.platforms.all;
    maintainers = with lib.maintainers; [ jopejoe1 ];
  };
})
