{
  lib,
  stdenv,
  fetchurl,
  fetchpatch,
  fetchFromGitHub,
  unzip,
  cmake,
}:

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
    cp "${./CMakeLists.txt}" CMakeLists.txt
    cp "${./lc3plus.pc.in}" lc3plus.pc.in
  '';

  meta = with lib; {
    description = "LC3plus bluetooth codecs";
    homepage = "https://www.iis.fraunhofer.de/en/ff/amm/communication/lc3.html";
    license = licenses.etsi-ipr;
    maintainers = with maintainers; [ jopejoe1 ];
    platforms = platforms.unix;
  };
})
