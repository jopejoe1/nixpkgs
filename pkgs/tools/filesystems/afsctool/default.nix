{ lib
, stdenv
, fetchFromGitHub
, pkg-config
, cmake
, git
, zlib
, sparsehash
}:

stdenv.mkDerivation rec {
  pname = "afsctool";
  version = "1.7.0";

  src = fetchFromGitHub {
    owner = "RJVB";
    repo = pname;
    rev = version;
    hash = "sha256-rqca7gpH46hk4MEPMHqYnteYJnGpLS/gu4XP7xWqDzo=";
  };

  nativeBuildInputs = [ pkg-config cmake git ];
  buildInputs = [ zlib sparsehash ];

  meta = with lib; {
    description = "Utility that allows end-users to leverage HFS+/APFS compression";
    license = licenses.unfree;
    maintainers = [ maintainers.viraptor ];
    platforms = platforms.darwin;
    homepage = "https://github.com/RJVB/afsctool";
  };
}
