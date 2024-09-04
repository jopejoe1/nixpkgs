{
  lib,
  stdenv,
  fetchFromGitHub,
  gitUpdater,
  cmake,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "dragonbox";
  version = "1.1.3";

  src = fetchFromGitHub {
    owner = "jk-jeon";
    repo = "dragonbox";
    rev = "refs/tags/${finalAttrs.version}";
    hash = "sha256-Sg9T8BJ/8KlL9O2ntPaNbWQ9Z1+Vv0C9pfa5KTRJvWM=";
  };

  nativeBuildInputs = [
    cmake
  ];

  postInstall = ''
    ln -s $out/include/dragonbox-*/dragonbox $out/include/dragonbox
  '';

  passthru.updateScript = gitUpdater { };

  meta = {
    description = "Reference implementation of Dragonbox in C++";
    homepage = "https://github.com/jk-jeon/dragonbox";
    maintainers = with lib.maintainers; [ jopejoe1 ];
    license = with lib.licenses; [ asl20 boost ];
    platforms = lib.platforms.unix;
  };
})
