{ lib
, stdenv
, fetchFromGitHub
, fetchpatch
, cmake
, perl
, pkg-config
, python3
, xmlto
, zip
, zlib
, testers
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "zziplib";
  version = "0.13.74";

  src = fetchFromGitHub {
    owner = "gdraheim";
    repo = "zziplib";
    rev = "v${finalAttrs.version}";
    hash = "sha256-MjqGHzb+dsAq2PrcBhU3sv4eMX3afkgFWUbhDp+5o/s=";
  };

  nativeBuildInputs = [
    cmake
    perl
    pkg-config
    python3
    xmlto
    zip
  ];
  buildInputs = [
    zlib
  ];

  # test/zziptests.py requires network access
  # (https://github.com/gdraheim/zziplib/issues/24)
  cmakeFlags = [
    "-DZZIP_TESTCVE=OFF"
    "-DBUILD_SHARED_LIBS=True"
    "-DBUILD_STATIC_LIBS=False"
    "-DBUILD_TESTS=OFF"
    "-DMSVC_STATIC_RUNTIME=OFF"
    "-DZZIPSDL=OFF"
    "-DZZIPTEST=OFF"
    "-DZZIPWRAP=OFF"
    "-DBUILDTESTS=OFF"
  ];

  passthru = {
    tests = {
      pkg-config = testers.testMetaPkgConfig finalAttrs.finalPackage;
    };
  };

  meta = with lib; {
    homepage = "https://github.com/gdraheim/zziplib";
    description = "Library to extract data from files archived in a zip file";
    longDescription = ''
      The zziplib library is intentionally lightweight, it offers the ability to
      easily extract data from files archived in a single zip file.
      Applications can bundle files into a single zip archive and access them.
      The implementation is based only on the (free) subset of compression with
      the zlib algorithm which is actually used by the zip/unzip tools.
    '';
    license = with licenses; [ lgpl2Plus mpl11 ];
    maintainers = with maintainers; [ AndersonTorres ];
    platforms = platforms.unix;
    pkgConfigModules = [ "zziplib" "zzipfseeko" "zzipmmapped" ];
  };
})
