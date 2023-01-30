{ lib, stdenv, fetchurl }:

stdenv.mkDerivation {
  pname = "FatBoy";
  version = "0.790";

  src = fetchurl {
    url = "https://archive.org/download/fat-boy-v-0.790/FatBoy-v0.790.sf2";
    sha256 = "b0b40d57aa4c413c74996c8d32a9b17f5dd97a07577eabacbfce2d3d439e2690";
  };

  sourceRoot = ".";

  installPhase = ''
    install -Dm644 "${src}" $out/share/soundfonts/FatBoy.sf2
  '';

  meta = with lib; {
    description = "A free GM/GS SoundFont for classic video game MIDI, emulation, and general usage.";
    homepage = "https://fatboy.site/";
    #Does not include any license information
    license = licenses.unfree;
    platforms = platforms.all;
    maintainers = with maintainers; [  ];
  };
}
