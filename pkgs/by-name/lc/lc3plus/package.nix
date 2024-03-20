{
  lib,
  stdenv,
  fetchurl,
  fetchFromGitHub,
  unzip,
  cmake,
}:

let
  buildFiles = fetchFromGitHub {
    owner = "bluekitchen";
    repo = "libLC3plus";
    rev = "887a9e1b3dd5e51462bc60b0400152eab51337ec";
    hash = "sha256-b41uxcwQ5n9qXK0VSQGOMfe8sudBM/B6651wJgSv74s=";
  };
in
stdenv.mkDerivation (finalAttrs: {
  pname = "lc3plus";
  version = "01.04.01";

  src = fetchurl {
    url = "https://www.etsi.org/deliver/etsi_ts/103600_103699/103634/${finalAttrs.version}_60/ts_103634v${builtins.replaceStrings [ "." ] [ "" ] finalAttrs.version}p0.zip";
    hash = "sha256-3dltZXArtlK/rtvvr92Q5pSISwWzZEWMLMeZp3LvyLo=";
  };

  nativeBuildInputs = [
    unzip
    cmake
  ];

  sourceRoot = "ETSI_Release/LC3plus_ETSI_src_va15eb59632b_20230228/src/fixed_point";

  postPatch = ''
    cp "${buildFiles}/CMakeLists.txt" CMakeLists.txt
    cp "${buildFiles}/LC3plus.pc.in" LC3plus.pc.in
    substituteInPlace LC3plus.pc.in \
    --replace "\''${exec_prefix}/@CMAKE_INSTALL_LIBDIR@" @CMAKE_INSTALL_FULL_LIBDIR@ \
    --replace "\''${prefix}/@CMAKE_INSTALL_INCLUDEDIR@" @CMAKE_INSTALL_FULL_INCLUDEDIR@
  '';

  meta = with lib; {
    description = "LC3plus bluetooth codecs";
    homepage = "https://www.iis.fraunhofer.de/en/ff/amm/communication/lc3.html";
    license = licenses.etsi-ipr;
    maintainers = with maintainers; [ jopejoe1 ];
    platforms = platforms.unix;
  };
})
