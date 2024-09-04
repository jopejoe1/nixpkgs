{
  lib,
  stdenv,
  fetchFromGitHub,
  gitUpdater,
  cmake,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "libfrozen";
  version = "1.2.0";

  src = fetchFromGitHub {
    owner = "serge-sans-paille";
    repo = "frozen";
    rev = "refs/tags/${finalAttrs.version}";
    hash = "sha256-checyHMJ+1w1HGkllNEaLO6NykNIjIfuxHXSmAYbDUU=";
  };

  nativeBuildInputs = [
    cmake
  ];

  passthru.updateScript = gitUpdater { };

  meta = {
    description = "Header-only, constexpr alternative to gperf for C++14 users";
    homepage = "https://github.com/serge-sans-paille/frozen";
    maintainers = with lib.maintainers; [ jopejoe1 ];
    license = lib.licenses.asl20;
    platforms = lib.platforms.unix;
  };
})
