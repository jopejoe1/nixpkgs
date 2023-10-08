{ lib,
stdenvNoCC,
fetchFromGitHub
}:

stdenvNoCC.mkDerivation rec {
  pname = "region-flags";
  version = "1.2.1";

  src = fetchFromGitHub {
    owner = "fonttools";
    repo = pname;
    rev = version;
    sha256 = "sha256-q4MkOf11vSBRYMFfjnDQN/U3ZZTJKa3K9P5qzvn45mQ=";
  };

  installPhase = ''
    install -m444 -Dt $out/html/ $src/html/*
    install -m444 -Dt $out/png/ $src/png/*
    install -m444 -Dt $out/svg/ $src/svg/*
  '';

  meta = with lib; {
    description = "Collection of flags for BCP 47 region codes in SVG / PNG ";
    homepage = "https://github.com/fonttools/region-flags";
    license = licenses.publicDomain;
    platforms = platforms.all;
    maintainers = with maintainers; [ jopejoe1 ];
  };
}
