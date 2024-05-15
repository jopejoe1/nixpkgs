{
  stdenv,
  fetchFromGitHub,
  lib,
  fetchpatch,
  cmake,
  pkg-config,
  glib,
  libsecret,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "libkeychain";
  version = "1.3.0";

  src = fetchFromGitHub {
    owner = "hrantzsch";
    repo = "keychain";
    rev = "v${finalAttrs.version}";
    hash = "sha256-cXTzPevd2yPkHxVyhnChT2Vgn6SKwWoREuZ8adhHqvc=";
  };

  outputs = [
    "out"
    "dev"
  ];

  buildInputs = [
    glib
    libsecret
  ];

  nativeBuildInputs = [
    cmake
    pkg-config
  ];

  cmakeFlags = [ "-DBUILD_SHARED_LIBS=ON" ];

  meta = with lib; {
    description = "A cross-platform wrapper for the OS credential storage";
    homepage = "https://github.com/hrantzsch/keychain";
    license = licenses.mit;
    maintainers = with maintainers; [ jopejoe1 ];
  };
})
