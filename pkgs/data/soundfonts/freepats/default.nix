{ lib, stdenv, fetchurl, p7zip }:

rec {
  upright-piano-kw = stdenv.mkDerivation {
      pname = "upright-piano-kw";
      version = "2022-02-21";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Piano/UprightPianoKW/UprightPianoKW-SF2-20220221.7z";
        sha256 = "sha256-F8CExuQgUjPcSbNOS8RKmy18eiwCsEcp7Np3B5sHyCY=";
      };

      unpackPhase = ''
        ${p7zip}/bin/7z x $src
      '';

      installPhase = ''
        install -Dm644 ./*/UprightPianoKW-*.sf2 $out/share/soundfonts/UprightPianoKW.sf2
      '';

      meta = with lib; {
      description = "Acoustic grand piano soundfont";
      homepage = "https://freepats.zenvoid.org/Piano/acoustic-grand-piano.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  ydp-grand-piano = stdenv.mkDerivation {
      pname = "ydp-grand-piano";
      version = "2016-08-04";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Piano/YDP-GrandPiano/YDP-GrandPiano-SF2-20160804.tar.bz2";
        sha256 = "sha256-0kPcPhgqYN8qFukoKMGCHPPrV0i0Xi4r3Pqc968FYCY=";
      };

      installPhase = ''
        install -Dm644 YDP-GrandPiano-*.sf2 $out/share/soundfonts/YDP-GrandPiano.sf2
      '';

      meta = with lib; {
      description = "Acoustic grand piano soundfont";
      homepage = "https://freepats.zenvoid.org/Piano/acoustic-grand-piano.html";
      license = licenses.cc-by-30;
      platforms = platforms.all;
      maintainers = with maintainers; [ ckie ];
    };
  };
  salamander-grand-piano = stdenv.mkDerivation {
      pname = "salamander-grand-piano";
      version = "V3+2020-06-02";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Piano/SalamanderGrandPiano/SalamanderGrandPiano-SF2-V3+20200602.tar.xz";
        sha256 = "sha256-Fe2wYde6YNWDMvctuo+M5AmIBIzHA/k15jIPN9ZQ4hM=";
      };

      installPhase = ''
        install -Dm644 SalamanderGrandPiano-*.sf2 $out/share/soundfonts/SalamanderGrandPiano.sf2
      '';

      meta = with lib; {
      description = "Acoustic grand piano soundfont";
      homepage = "https://freepats.zenvoid.org/Piano/acoustic-grand-piano.html";
      license = licenses.cc-by-30;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  old-piano-fb = stdenv.mkDerivation {
      pname = "old-piano-fb";
      version = "2020-04-01";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Piano/PianoFB/PianoFB-SF2-20200401.7z";
        sha256 = "sha256-2M03K3EJJqdrDU+UYjmrFmJcXfR2AbOW+jsofSMolX4=";
      };

      unpackPhase = ''
        ${p7zip}/bin/7z x $src
      '';

      installPhase = ''
        install -Dm644 ./*/PianoFB-*.sf2 $out/share/soundfonts/PianoFB.sf2
      '';

      meta = with lib; {
      description = "Honky-tonk Piano soundfont";
      homepage = "https://freepats.zenvoid.org/Piano/honky-tonk-piano.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  fm-synthesized-piano-1 = stdenv.mkDerivation {
      pname = "fm-synthesized-piano-1";
      version = "2016-11-08";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/ElectricPiano/FM-Piano1/FM-Piano1-SF2-20190916.tar.xz";
        sha256 = "sha256-GkPNnSgfbGQI+AgKuAg9/AjX67eDBNUdmKzcPAylC0s=";
      };

      installPhase = ''
        install -Dm644 FM-Piano1-*.sf2 $out/share/soundfonts/FM-Piano1.sf2
      '';

      meta = with lib; {
      description = "Synthesized Piano soundfont";
      homepage = "https://freepats.zenvoid.org/ElectricPiano/synthesized-piano.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  fm-synthesized-piano-2 = stdenv.mkDerivation {
      pname = "fm-synthesized-piano-2";
      version = "2016-11-12";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/ElectricPiano/FM-Piano2/FM-Piano2-20161112.tar.xz";
        sha256 = "sha256-IGi9VJWtdmEQU9TdK2AP+csBtKWYYgV0hCmTK+yBoV8=";
      };

      installPhase = ''
        install -Dm644 FM-Piano2-*.sf2 $out/share/soundfonts/FM-Piano2.sf2
      '';

      meta = with lib; {
      description = "Synthesized Piano soundfont";
      homepage = "https://freepats.zenvoid.org/ElectricPiano/synthesized-piano.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  glasses-of-water = stdenv.mkDerivation {
      pname = "glasses-of-water";
      version = "2019-12-27";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/ChromaticPercussion/Glass/Glass-SF2-20191227.7z";
        sha256 = "sha256-5zkSB38s9MFqaGG6B1LIZM54wbX2CbiQ38vbMSqL+xU=";
      };

      unpackPhase = ''
        ${p7zip}/bin/7z x $src
      '';

      installPhase = ''
        install -Dm644 ./*/Glass-*.sf2 $out/share/soundfonts/Glass.sf2
      '';

      meta = with lib; {
      description = "Glass soundfont";
      homepage = "https://freepats.zenvoid.org/ChromaticPercussion/glass.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  hang-tuned-in-d-minor = stdenv.mkDerivation {
      pname = "hang-tuned-in-d-minor";
      version = "2022-03-30";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/ChromaticPercussion/HangDminor/Hang-D-minor-SF2-20220330.7z";
        sha256 = "sha256-14aUw/umy5/GA3dHv+wJuPRwStIWyKuWOEYrIRhX6Ek=";
      };

      unpackPhase = ''
        ${p7zip}/bin/7z x $src
      '';

      installPhase = ''
        install -Dm644 ./*/Hang-D-minor-*.sf2 $out/share/soundfonts/Hang-D-minor.sf2
      '';

      meta = with lib; {
      description = "Hang soundfont";
      homepage = "https://freepats.zenvoid.org/ChromaticPercussion/hang.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  tubular-bells = stdenv.mkDerivation {
      pname = "tubular-bells";
      version = "2020-07-29";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/ChromaticPercussion/TubularBells/TubularBells-SF2-20200729.tar.xz";
        sha256 = "sha256-Za+KfsFEjQuhMO9yO+TVenCmqJ090XxLGgpLVPXWnNc=";
      };

      installPhase = ''
        install -Dm644 TubularBells-*.sf2 $out/share/soundfonts/TubularBells.sf2
      '';

      meta = with lib; {
      description = "Tubular Bells soundfont";
      homepage = "https://freepats.zenvoid.org/ChromaticPercussion/tubular-bells.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  xylophone = stdenv.mkDerivation {
      pname = "xylophone";
      version = "2020-07-29";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/ChromaticPercussion/Xylophone1/Xylophone-MediumMallets-SF2-20200706.tar.xz";
        sha256 = "sha256-sULyol8GEPE9HWV8YK4/KL5YzwJtIWgmElxvudGvYxs=";
      };

      installPhase = ''
        install -Dm644 Xylophone-*.sf2 $out/share/soundfonts/Xylophone.sf2
      '';

      meta = with lib; {
      description = "Xylophone soundfont";
      homepage = "https://freepats.zenvoid.org/ChromaticPercussion/xylophone.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  church-organ-emulation = stdenv.mkDerivation {
      pname = "church-organ-emulation";
      version = "2019-09-24";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Organ/ChurchOrganEmulation/ChurchOrganEmulation-SF2-20190924.tar.xz";
        sha256 = "sha256-7X+aFE++lDzzvLJRBV2gDlpmfUpw+kccQvBiQCcIPDA=";
      };

      installPhase = ''
        install -Dm644 ChurchOrganEmulation-*.sf2 $out/share/soundfonts/ChurchOrganEmulation.sf2
      '';

      meta = with lib; {
      description = "Pipe Organ soundfont";
      homepage = "https://freepats.zenvoid.org/Organ/pipe-organ.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  drawbar-organ-emulation = stdenv.mkDerivation {
      pname = "drawbar-organ-emulation";
      version = "2019-07-12";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Organ/DrawbarOrganEmulation/DrawbarOrganEmulation-SF2-20190712.tar.xz";
        sha256 = "sha256-m0H6hBj28aFJJDgbxsy927Zlu+wrX0bUq1SejYii4Xg=";
      };

      installPhase = ''
        install -Dm644 DrawbarOrganEmulation-*.sf2 $out/share/soundfonts/DrawbarOrganEmulation.sf2
      '';

      meta = with lib; {
      description = "Electric Organ soundfont";
      homepage = "https://freepats.zenvoid.org/Organ/electric-organ.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  percussive-organ-emulation = stdenv.mkDerivation {
      pname = "percussive-organ-emulation";
      version = "2019-07-15";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Organ/PercussiveOrganEmulation/PercussiveOrganEmulation-SF2-20190715.tar.xz";
        sha256 = "sha256-QsTgAERMDO8iZDkujvAIGHhKHsL7SZNsOUvrvkcgBiw=";
      };

      installPhase = ''
        install -Dm644 PercussiveOrganEmulation-*.sf2 $out/share/soundfonts/PercussiveOrganEmulation.sf2
      '';

      meta = with lib; {
      description = "Electric Organ soundfont";
      homepage = "https://freepats.zenvoid.org/Organ/electric-organ.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  rock-organ-emulation = stdenv.mkDerivation {
      pname = "rock-organ-emulation";
      version = "2019-07-15";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Organ/RockOrganEmulation/RockOrganEmulation-SF2-20190715.tar.xz";
        sha256 = "sha256-W+JSMXzFEdDZLpSwfiKJVAtX5Dgew0smOS5oX5sdUF0=";
      };

      installPhase = ''
        install -Dm644 RockOrganEmulation-*.sf2 $out/share/soundfonts/RockOrganEmulation.sf2
      '';

      meta = with lib; {
      description = "Electric Organ soundfont";
      homepage = "https://freepats.zenvoid.org/Organ/electric-organ.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  spanish-classical-guitar = stdenv.mkDerivation {
      pname = "spanish-classical-guitar";
      version = "2019-06-18";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Guitar/SpanishClassicalGuitar/SpanishClassicalGuitar-SF2-20190618.7z";
        sha256 = "sha256-jBkvH8ZApVMZmkpDoXrhI1SmoF49aq15vUO10pMU/1E=";
      };

      unpackPhase = ''
        ${p7zip}/bin/7z x $src
      '';

      installPhase = ''
        install -Dm644 ./*/SpanishClassicalGuitar-*.sf2 $out/share/soundfonts/SpanishClassicalGuitar.sf2
      '';

      meta = with lib; {
      description = "Nylon-String Acoustic Guitar soundfont";
      homepage = "https://freepats.zenvoid.org/Guitar/acoustic-guitar.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  fss-steel-string-acoustic-guitar = stdenv.mkDerivation {
      pname = "fss-steel-string-acoustic-guitar";
      version = "2020-05-21";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Guitar/FSS-SteelStringGuitar/FSS-SteelStringGuitar-SF2-20200521.tar.xz";
        sha256 = "sha256-Fs5GXFhjqgTyCbUts5nCtxkqludQmrMu1UfUA7WfSPE=";
      };

      installPhase = ''
        install -Dm644 FSS-SteelStringGuitar-*.sf2 $out/share/soundfonts/FSS-SteelStringGuitar.sf2
      '';

      meta = with lib; {
      description = "Steel-String Acoustic Guitar soundfont";
      homepage = "https://freepats.zenvoid.org/Guitar/steel-acoustic-guitar.html";
      license = licenses.gpl3FreepatsPlus;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  fsbs-electric-guitar-clean-1 = stdenv.mkDerivation {
      pname = "fsbs-electric-guitar-clean-1";
      version = "2022-09-11";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/ElectricGuitar/FSBS-EGuitar/EGuitarFSBS-bridge-clean-SF2-20220911.7z";
        sha256 = "sha256-RXua/IZOdj6ForEhxYmtN6VY/G+LN4MKmpgXLIoMVqo=";
      };

      unpackPhase = ''
        ${p7zip}/bin/7z x $src
      '';

      installPhase = ''
        install -Dm644 ./*/EGuitarFSBS-*.sf2 $out/share/soundfonts/EGuitarFSBS.sf2
      '';

      meta = with lib; {
      description = "Clean Electric Guitar soundfont";
      homepage = "https://freepats.zenvoid.org/ElectricGuitar/clean-electric-guitar.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  fsbs-electric-guitar-clean-2-jazz = stdenv.mkDerivation {
      pname = "fsbs-electric-guitar-clean-2-jazz";
      version = "2022-09-11";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/ElectricGuitar/FSBS-EGuitar/EGuitarFSBS-bridge-jazz-SF2-20220911.7z";
        sha256 = "sha256-3nD7NsG9mt2mDCwcXAIRJMrS6wg8JLkfx06A63XP9EM=";
      };

      unpackPhase = ''
        ${p7zip}/bin/7z x $src
      '';

      installPhase = ''
        install -Dm644 ./*/EGuitarFSBS-*.sf2 $out/share/soundfonts/EGuitarFSBS-jazz.sf2
      '';

      meta = with lib; {
      description = "Clean Electric Guitar soundfont";
      homepage = "https://freepats.zenvoid.org/ElectricGuitar/clean-electric-guitar.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  fsbs-electric-guitar-direct = stdenv.mkDerivation {
      pname = "fsbs-electric-guitar-direct";
      version = "2022-09-11";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/ElectricGuitar/FSBS-EGuitar/EGuitarFSBS-bridge-direct-SF2-20220911.7z";
        sha256 = "sha256-aQIOEFv3K+labhuB/0VTcn+xK8jwPw7DyxfUy+rtCWE=";
      };

      unpackPhase = ''
        ${p7zip}/bin/7z x $src
      '';

      installPhase = ''
        install -Dm644 ./*/EGuitarFSBS-*.sf2 $out/share/soundfonts/EGuitarFSBS-direct.sf2
      '';

      meta = with lib; {
      description = "Clean Electric Guitar soundfont";
      homepage = "https://freepats.zenvoid.org/ElectricGuitar/clean-electric-guitar.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  fsbs-electric-guitar-distorted-1 = stdenv.mkDerivation {
      pname = "fsbs-electric-guitar-distorted-1";
      version = "2022-09-11";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/ElectricGuitar/FSBS-EGuitar/EGuitarFSBS-bridge-dist1-SF2-20220911.7z";
        sha256 = "sha256-t8Ms6l77z4AtRL3Kv6R+V6Xd8RCfHF4A0zchg1gichA=";
      };

      unpackPhase = ''
        ${p7zip}/bin/7z x $src
      '';

      installPhase = ''
        install -Dm644 ./*/EGuitarFSBS-*.sf2 $out/share/soundfonts/EGuitarFSBS-dist1.sf2
      '';

      meta = with lib; {
      description = "Distorted Electric Guitar soundfont";
      homepage = "https://freepats.zenvoid.org/ElectricGuitar/distorted-electric-guitar.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  bass-guitar-yr = stdenv.mkDerivation {
      pname = "bass-guitar-yr";
      version = "2019-09-30";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/ElectricGuitar/BassYR/PickedBassYR-SF2-20190930.tar.xz";
        sha256 = "sha256-iutgGS6f9qAKWPk4vi9BKAOd+pGOMSVgS64J7o/Aa/0=";
      };

      installPhase = ''
        install -Dm644 PickedBassYR-*.sf2 $out/share/soundfonts/PickedBassYR.sf2
      '';

      meta = with lib; {
      description = "Clean Electric Bass soundfont";
      homepage = "https://freepats.zenvoid.org/ElectricGuitar/clean-electric-bass.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  bass-guitar-fs-y-direct = stdenv.mkDerivation {
      pname = "bass-guitar-fs-y-direct";
      version = "2020-04-13";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/ElectricGuitar/BassFSY/BassDirectFSY-SF2-20200413.tar.xz";
        sha256 = "sha256-RopKSU27SWw3t0yb/oad/2eydUAqomb5WYKd36xrlg8=";
      };

      installPhase = ''
        install -Dm644 BassDirectFSY-*.sf2 $out/share/soundfonts/BassDirectFSY.sf2
      '';

      meta = with lib; {
      description = "Clean Electric Bass soundfont";
      homepage = "https://freepats.zenvoid.org/ElectricGuitar/clean-electric-bass.html";
      license = licenses.gpl3FreepatsPlus;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  bass-guitar-fs-y-clean = stdenv.mkDerivation {
      pname = "bass-guitar-fs-y-clean";
      version = "2020-04-18";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/ElectricGuitar/BassFSY/BassCleanFSY-SF2-20200418.tar.xz";
        sha256 = "sha256-lg/6vNnFVz6k281XT0b/NnXeIGDw84DdhQVB/7jCxIA=";
      };

      installPhase = ''
        install -Dm644 BassCleanFSY-*.sf2 $out/share/soundfonts/BassCleanFSY.sf2
      '';

      meta = with lib; {
      description = "Clean Electric Bass soundfont";
      homepage = "https://freepats.zenvoid.org/ElectricGuitar/clean-electric-bass.html";
      license = licenses.gpl3FreepatsPlus;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  concert-harp = stdenv.mkDerivation {
      pname = "concert-harp";
      version = "2020-07-02";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/OrchestralStrings/ConcertHarp/ConcertHarp-SF2-20200702.tar.xz";
        sha256 = "sha256-oyj6oZljaRVPIPlg3eLiVblugjV01c+A655/AK7WoVA=";
      };

      installPhase = ''
        install -Dm644 ConcertHarp-*.sf2 $out/share/soundfonts/ConcertHarp.sf2
      '';

      meta = with lib; {
      description = "Concert Harp soundfont";
      homepage = "https://freepats.zenvoid.org/OrchestralStrings/harp.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  clarinet = stdenv.mkDerivation {
      pname = "clarinet";
      version = "2019-08-18";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Reed/Clarinet1/Clarinet-SF2-20190818.tar.xz";
        sha256 = "sha256-PwaqR0fPUvtZXVd4sUcHCioCE7zqMxAF4xnYsR1gal4=";
      };

      installPhase = ''
        install -Dm644 Clarinet-*.sf2 $out/share/soundfonts/Clarinet.sf2
      '';

      meta = with lib; {
      description = "Clarinet soundfont";
      homepage = "https://freepats.zenvoid.org/Reed/clarinet.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  tenor-saxophone = stdenv.mkDerivation {
      pname = "tenor-saxophone";
      version = "2020-07-17";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Reed/TenorSaxophone/TenorSaxophone-SF2-20200717.tar.bz2";
        sha256 = "sha256-92QM8gOWYrFbRSG7VhXh3cQmcxVZtMMQecten1Dhb6A=";
      };

      installPhase = ''
        install -Dm644 TenorSaxophone-*.sf2 $out/share/soundfonts/TenorSaxophone.sf2
      '';

      meta = with lib; {
      description = "Saxophone soundfont";
      homepage = "https://freepats.zenvoid.org/Reed/saxophone.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  wooden-recorder = stdenv.mkDerivation {
      pname = "wooden-recorder";
      version = "2020-12-05";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Wind/Recorder1/Recorder-SF2-20201205.7z";
        sha256 = "sha256-YCWMYPzvnjmKyiJ0nNvqunkrj6fJEV5jzu86/11L0cA=";
      };

      unpackPhase = ''
        ${p7zip}/bin/7z x $src
      '';

      installPhase = ''
        install -Dm644 ./*/Recorder-*.sf2 $out/share/soundfonts/Recorder.sf2
      '';

      meta = with lib; {
      description = "Recorder soundfont";
      homepage = "https://freepats.zenvoid.org/Wind/recorder.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  ocarina = stdenv.mkDerivation {
      pname = "ocarina";
      version = "2020-07-26";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Wind/Ocarina1/Ocarina-SF2-20200726.7z";
        sha256 = "sha256-6NERPN3g9Qqpf0ePjsSKT337C+dXlJncomFbNkGSLAE=";
      };

      unpackPhase = ''
        ${p7zip}/bin/7z x $src
      '';

      installPhase = ''
        install -Dm644 ./*/Ocarina-*.sf2 $out/share/soundfonts/Ocarina.sf2
      '';

      meta = with lib; {
      description = "Ocarina soundfont";
      homepage = "https://freepats.zenvoid.org/Wind/ocarina.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  synth-bass-1 = stdenv.mkDerivation {
      pname = "synth-bass-1";
      version = "2019-07-23";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Synthesizer/SynthBass1/SynthBass1-SF2-20190723.7z";
        sha256 = "sha256-KXU0hd4XXsCOqxzsRT+TPnHwAikZ3K3qgGP6xRs/2RE=";
      };

      unpackPhase = ''
        ${p7zip}/bin/7z x $src
      '';

      installPhase = ''
        install -Dm644 ./*/SynthBass1-*.sf2 $out/share/soundfonts/SynthBass1.sf2
      '';

      meta = with lib; {
      description = "Synth Bass soundfont";
      homepage = "https://freepats.zenvoid.org/Synthesizer/synth-bass.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  synth-bass-2 = stdenv.mkDerivation {
      pname = "synth-bass-2";
      version = "2021-04-05";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Synthesizer/SynthBass2/SynthBass2-SF2-20210405.7z";
        sha256 = "sha256-7HpT45t+laVBgzVegfHJfiyotFUdnWgXi2BNKBK1QBo=";
      };

      unpackPhase = ''
        ${p7zip}/bin/7z x $src
      '';

      installPhase = ''
        install -Dm644 ./*/SynthBass2-*.sf2 $out/share/soundfonts/SynthBass2.sf2
      '';

      meta = with lib; {
      description = "Synth Bass soundfont";
      homepage = "https://freepats.zenvoid.org/Synthesizer/synth-bass.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  synth-strings-1 = stdenv.mkDerivation {
      pname = "synth-strings-1";
      version = "2020-05-28";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Synthesizer/SynthStrings1/SynthStrings1-SF2-20200528.tar.xz";
        sha256 = "sha256-TzPnRYvZG+ppBp9aKqmy1paVH2Yil12mssZ2AwgLALE=";
      };

      installPhase = ''
        install -Dm644 SynthStrings1-*.sf2 $out/share/soundfonts/SynthStrings1.sf2
      '';

      meta = with lib; {
      description = "Synth Strings soundfont";
      homepage = "https://freepats.zenvoid.org/Synthesizer/synth-strings.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  synth-strings-2 = stdenv.mkDerivation {
      pname = "synth-strings-2";
      version = "2020-05-28";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Synthesizer/SynthStrings2/SynthStrings2-SF2-20200528.tar.bz2";
        sha256 = "sha256-COxZ/iM2yEmjgpHw4psc7v7Ko7p41xXs84Y3nI/YZ4o=";
      };

      installPhase = ''
        install -Dm644 SynthStrings2-*.sf2 $out/share/soundfonts/SynthStrings2.sf2
      '';

      meta = with lib; {
      description = "Synth Strings soundfont";
      homepage = "https://freepats.zenvoid.org/Synthesizer/synth-strings.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  synth-brass-1 = stdenv.mkDerivation {
      pname = "synth-brass-1";
      version = "2021-04-26";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Synthesizer/SynthBrass1/SynthBrass1-SF2-20210426.7z";
        sha256 = "sha256-mBE0rnnaSl2DrnbBL9Ie8QJyMza/5Tn8v7Pul3q74x4=";
      };

      unpackPhase = ''
        ${p7zip}/bin/7z x $src
      '';

      installPhase = ''
        install -Dm644 ./*/SynthBrass1-*.sf2 $out/share/soundfonts/SynthBrass1.sf2
      '';

      meta = with lib; {
      description = "Synth Brass soundfont";
      homepage = "https://freepats.zenvoid.org/Synthesizer/synth-brass.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  synth-brass-2 = stdenv.mkDerivation {
      pname = "synth-brass-2";
      version = "2019-08-14";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Synthesizer/SynthBrass2/SynthBrass2-SF2-20190814.7z";
        sha256 = "sha256-l3tU+aP4A7Zthnd9hTfc6xjSoE3tGTr5JcLPcmBtk3Y=";
      };

      unpackPhase = ''
        ${p7zip}/bin/7z x $src
      '';

      installPhase = ''
        install -Dm644 ./*/SynthBrass2-*.sf2 $out/share/soundfonts/SynthBrass2.sf2
      '';

      meta = with lib; {
      description = "Synth Brass soundfont";
      homepage = "https://freepats.zenvoid.org/Synthesizer/synth-brass.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  synth-lead-square = stdenv.mkDerivation {
      pname = "synth-lead-square";
      version = "2020-05-12";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Synthesizer/SynthSquare/SynthSquare-SF2-20200512.tar.xz";
        sha256 = "sha256-pOhGXr/PSP8y9poiCf6M/jVMTeCHRQPay5HDhMIG8ck=";
      };

      installPhase = ''
        install -Dm644 SynthSquare-*.sf2 $out/share/soundfonts/SynthSquare.sf2
      '';

      meta = with lib; {
      description = "Synth Lead soundfont";
      homepage = "https://freepats.zenvoid.org/Synthesizer/synth-lead.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  synth-lead-calliope = stdenv.mkDerivation {
      pname = "synth-lead-calliope";
      version = "2020-05-12";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Synthesizer/SynthCalliope/SynthCalliope-SF2-20200512.tar.xz";
        sha256 = "sha256-uqOOvq39P/qvj1dfmgQVcYRAr7+cDpWFCRPgQMNXBkk=";
      };

      installPhase = ''
        install -Dm644 SynthCalliope-*.sf2 $out/share/soundfonts/SynthCalliope.sf2
      '';

      meta = with lib; {
      description = "Synth Lead soundfont";
      homepage = "https://freepats.zenvoid.org/Synthesizer/synth-lead.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  synth-fifths = stdenv.mkDerivation {
      pname = "synth-fifths";
      version = "2020-05-19";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Synthesizer/SynthFifths/SynthFifths-SF2-20200519.tar.xz";
        sha256 = "sha256-BN7I0dBFVjU15zY/leTErcXJukEHEd3mPVm6PcReSJs=";
      };

      installPhase = ''
        install -Dm644 SynthFifths-*.sf2 $out/share/soundfonts/SynthFifths.sf2
      '';

      meta = with lib; {
      description = "Synth Lead soundfont";
      homepage = "https://freepats.zenvoid.org/Synthesizer/synth-lead.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  synth-bass-lead = stdenv.mkDerivation {
      pname = "synth-bass-lead";
      version = "2020-05-22";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Synthesizer/SynthBassLead/SynthBassLead-SF2-20200522.7z";
        sha256 = "sha256-o5SioVlIArcSqa15WY6O1b1NuH+f/BLZwLAmoDgW1r4=";
      };

      unpackPhase = ''
        ${p7zip}/bin/7z x $src
      '';

      installPhase = ''
        install -Dm644 ./*/SynthBassLead-*.sf2 $out/share/soundfonts/SynthBassLead.sf2
      '';

      meta = with lib; {
      description = "Synth Lead soundfont";
      homepage = "https://freepats.zenvoid.org/Synthesizer/synth-lead.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  new-age = stdenv.mkDerivation {
      pname = "new-age";
      version = "2019-07-30";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Synthesizer/NewAge/NewAge-SF2-20190730.7z";
        sha256 = "sha256-YBHNc6kgRQjkS2eatbNxAJqJiMNa5VudOTLqFV/+roY=";
      };

      unpackPhase = ''
        ${p7zip}/bin/7z x $src
      '';

      installPhase = ''
        install -Dm644 ./*/NewAge-*.sf2 $out/share/soundfonts/NewAge.sf2
      '';

      meta = with lib; {
      description = "Synth Pad soundfont";
      homepage = "https://freepats.zenvoid.org/Synthesizer/synth-pad.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  synth-pad-choir = stdenv.mkDerivation {
      pname = "synth-pad-choir";
      version = "2020-05-16";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Synthesizer/SynthPadChoir/SynthPadChoir-SF2-20200516.tar.xz";
        sha256 = "sha256-3A7tmbySHZcn8KGcTpYcteuQo15xKrCEUJ86Z2h1SjE=";
      };

      installPhase = ''
        install -Dm644 SynthPadChoir-*.sf2 $out/share/soundfonts/SynthPadChoir.sf2
      '';

      meta = with lib; {
      description = "Synth Pad soundfont";
      homepage = "https://freepats.zenvoid.org/Synthesizer/synth-pad.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  synth-pad-bowed = stdenv.mkDerivation {
      pname = "synth-pad-bowed";
      version = "2019-07-19";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Synthesizer/SynthPadBowed/SynthPadBowed-SF2-20190719.tar.xz";
        sha256 = "sha256-VWj7Jh7IbpjKSg2B6yp0jTf7Y7qj3GSqYj0sN17lxiw=";
      };

      installPhase = ''
        install -Dm644 SynthPadBowed-*.sf2 $out/share/soundfonts/SynthPadBowed.sf2
      '';

      meta = with lib; {
      description = "Synth Pad soundfont";
      homepage = "https://freepats.zenvoid.org/Synthesizer/synth-pad.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  sweep-pad = stdenv.mkDerivation {
      pname = "sweep-pad";
      version = "2019-08-13";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Synthesizer/SweepPad/SweepPad-SF2-20190813.7z";
        sha256 = "sha256-b9pJD9EtT3A89tFlBaz8kQY2lVJC/Xr7bhcjIs5VvrI=";
      };

      unpackPhase = ''
        ${p7zip}/bin/7z x $src
      '';

      installPhase = ''
        install -Dm644 ./*/SweepPad-*.sf2 $out/share/soundfonts/SweepPad.sf2
      '';

      meta = with lib; {
      description = "Synth Pad soundfont";
      homepage = "https://freepats.zenvoid.org/Synthesizer/synth-pad.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  synth-soundtrack = stdenv.mkDerivation {
      pname = "synth-soundtrack";
      version = "2020-05-21";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Synthesizer/SynthSoundtrack/SynthSoundtrack-SF2-20200521.tar.xz";
        sha256 = "sha256-vGaY997Kyiow7BtCMFrUcO4gKW/Q9DAHYgsSsox6+QY=";
      };

      installPhase = ''
        install -Dm644 SynthSoundtrack-*.sf2 $out/share/soundfonts/SynthSoundtrack.sf2
      '';

      meta = with lib; {
      description = "Synth Effects soundfont";
      homepage = "https://freepats.zenvoid.org/Synthesizer/synth-effects.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  synth-crystal = stdenv.mkDerivation {
      pname = "synth-crystal";
      version = "2019-08-12";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Synthesizer/SynthCrystal/SynthCrystal-SF2-20190812.tar.xz";
        sha256 = "sha256-ua21mMTWZmzvTuHALYmUUsHKO7wyQdW3KL1VM9n3+qU=";
      };

      installPhase = ''
        install -Dm644 SynthCrystal-*.sf2 $out/share/soundfonts/SynthCrystal.sf2
      '';

      meta = with lib; {
      description = "Synth Effects soundfont";
      homepage = "https://freepats.zenvoid.org/Synthesizer/synth-effects.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  synth-goblins = stdenv.mkDerivation {
      pname = "synth-goblins";
      version = "2020-06-12";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Synthesizer/SynthGoblins/SynthGoblins-SF2-20200612.tar.bz2";
        sha256 = "sha256-ZrWbG4Zm0kbOmNt+0cbEhivzmQdESd1nEBOoUKh2Jeg=";
      };

      installPhase = ''
        install -Dm644 SynthGoblins-*.sf2 $out/share/soundfonts/SynthGoblins.sf2
      '';

      meta = with lib; {
      description = "Synth Effects soundfont";
      homepage = "https://freepats.zenvoid.org/Synthesizer/synth-effects.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  synth-sci-fi = stdenv.mkDerivation {
      pname = "synth-sci-fi";
      version = "2020-05-17";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Synthesizer/SynthSciFi/SynthSciFi-SF2-20200517.tar.xz";
        sha256 = "sha256-GaJPJ5ScP9m/SsTpSPOZ9w8yxSi1cpigRNRfk0QKvcE=";
      };

      installPhase = ''
        install -Dm644 SynthSciFi-*.sf2 $out/share/soundfonts/SynthSciFi.sf2
      '';

      meta = with lib; {
      description = "Synth Effects soundfont";
      homepage = "https://freepats.zenvoid.org/Synthesizer/synth-effects.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  bagpipes = stdenv.mkDerivation {
      pname = "bagpipes";
      version = "2022-12-04";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Ethnic/Bagpipe/Bagpipe-SF2-20221204.7z";
        sha256 = "sha256-mzZRfLVUSD3oa//6kCnsDqPZdHD5lhtREhU76mtA0yA=";
      };

      unpackPhase = ''
        ${p7zip}/bin/7z x $src
      '';

      installPhase = ''
        install -Dm644 Bagpipe-SF2-20221204/Bagpipe-*.sf2 $out/share/soundfonts/Bagpipe.sf2
      '';

      meta = with lib; {
      description = "Bagpipes soundfont";
      homepage = "https://freepats.zenvoid.org/Ethnic/bagpipe.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  kalimba = stdenv.mkDerivation {
      pname = "kalimba";
      version = "2019-05-31";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Ethnic/Kalimba/Kalimba-SF2-20190723.tar.xz";
        sha256 = "sha256-w5HJye1OkfM4Qzg9b/7+eF2ZrPqVlNn8GUWvuktYJHY=";
      };

      installPhase = ''
        install -Dm644 Kalimba-*.sf2 $out/share/soundfonts/Kalimba.sf2
      '';

      meta = with lib; {
      description = "Kalimba soundfont";
      homepage = "https://freepats.zenvoid.org/Ethnic/kalimba.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  jaw-harp = stdenv.mkDerivation {
      pname = "jaw-harp";
      version = "2020-06-06";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Ethnic/JawHarp/JawHarp-SF2-20200606.tar.bz2";
        sha256 = "sha256-VRroGKpx5QCPRTGBIRkf/kMgB/CQAr3yFXBDcKB3kdo=";
      };

      installPhase = ''
        install -Dm644 JawHarp-*.sf2 $out/share/soundfonts/JawHarp.sf2
      '';

      meta = with lib; {
      description = "Jaw Harp soundfont";
      homepage = "https://freepats.zenvoid.org/Ethnic/jaw-harp.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  colombo-acoustic-drum-kit = stdenv.mkDerivation {
      pname = "colombo-acoustic-drum-kit";
      version = "2020-05-30";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Percussion/ColomboAcousticDrumKit/ColomboADK-FreePats-SF2-20200530.tar.xz";
        sha256 = "sha256-oTf6IgE3uiiQObmg9vdR1d0i3YtzK7y/NvIYkd09YCg=";
      };

      installPhase = ''
        install -Dm644 ColomboADK-*.sf2 $out/share/soundfonts/ColomboADK.sf2
      '';

      meta = with lib; {
      description = "Acoustic Drum Kit soundfont";
      homepage = "https://freepats.zenvoid.org/Percussion/acoustic-drum-kit.html";
      license = licenses.gpl2FreepatsPlus;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  muldjord-kit = stdenv.mkDerivation {
      pname = "muldjord-kit";
      version = "2020-10-18";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Percussion/MuldjordKit/MuldjordKit-SF2-20201018.tar.bz2";
        sha256 = "sha256-NTvOnoQliZeMpRNEfPJx+PFGdPeMIVNxx7jKsvb4Kc8=";
      };

      installPhase = ''
        install -Dm644 MuldjordKit-*.sf2 $out/share/soundfonts/MuldjordKit.sf2
      '';

      meta = with lib; {
      description = "Acoustic Drum Kit soundfont";
      homepage = "https://freepats.zenvoid.org/Percussion/acoustic-drum-kit.html";
      license = licenses.cc-by-40;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  timpani = stdenv.mkDerivation {
      pname = "timpani";
      version = "2020-11-21";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Percussion/Timpani/Timpani-SF2-20201121.tar.bz2";
        sha256 = "sha256-TgEtm83VfT102RNT/4COr9djazVxq15dgtBZW2Xcg1M=";
      };

      installPhase = ''
        install -Dm644 Timpani-*.sf2 $out/share/soundfonts/Timpani.sf2
      '';

      meta = with lib; {
      description = "Orchestral Percussion soundfont";
      homepage = "https://freepats.zenvoid.org/Percussion/orchestral-percussion.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  synthesizer-percussion = stdenv.mkDerivation {
      pname = "synthesizer-percussion";
      version = "2022-07-18";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Percussion/SynthesizerPercussion/SynthesizerPercussion-SF2-20220718.7z";
        sha256 = "sha256-b/ZYAWUGHqwxE6mWHh6Thgya+HqCtSOkmUnwmdb0fqM=";
      };

      unpackPhase = ''
        ${p7zip}/bin/7z x $src
      '';

      installPhase = ''
        install -Dm644 ./*/SynthesizerPercussion-*.sf2 $out/share/soundfonts/SynthesizerPercussion.sf2
      '';

      meta = with lib; {
      description = "Electric and Synthesizer Percussion soundfont";
      homepage = "https://freepats.zenvoid.org/Percussion/electric-percussion.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  world-percussion = stdenv.mkDerivation {
      pname = "world-percussion";
      version = "2020-09-05";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/Percussion/WorldPercussion/WorldPercussion-SF2-20200905.tar.bz2";
        sha256 = "sha256-EQ9zZ+i8f+1IYOf3B81iKfT3lc62yMa5CZDTJc1DO0A=";
      };

      installPhase = ''
        install -Dm644 WorldPercussion-*.sf2 $out/share/soundfonts/WorldPercussion.sf2
      '';

      meta = with lib; {
      description = "World and Rare Percussion soundfont";
      homepage = "https://freepats.zenvoid.org/Percussion/world-and-rare-percussion.html";
      license = licenses.cc0;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  general-midi = stdenv.mkDerivation {
      pname = "general-midi";
      version = "2022-10-26";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/SoundSets/FreePats-GeneralMIDI/FreePatsGM-SF2-20221026.7z";
        sha256 = "sha256-wvXHd4UeOthsuhGb+RqmuRUCJRLoHDfqAQ7mo/i1QV0=";
      };

      unpackPhase = ''
        ${p7zip}/bin/7z x $src
      '';

      installPhase = ''
        install -Dm644 ./*/FreePatsGM-*.sf2 $out/share/soundfonts/FreePatsGM.sf2
      '';

      meta = with lib; {
      description = "General MIDI soundfont";
      homepage = "https://freepats.zenvoid.org/SoundSets/general-midi.html";
      license = licenses.gpl3FreepatsPlus;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
  general-midi-percussion = stdenv.mkDerivation {
      pname = "general-midi-percussion";
      version = "2020-08-22";

      src = fetchurl {
        url = "https://freepats.zenvoid.org/SoundSets/GM-PercussionSet/FreePatsGM-Percussion-SF2-20200822.tar.xz";
        sha256 = "sha256-o0Kt6HW4iIXW2n0bYOeaQ4WryTV7dGmyBScuc0VxFA4=";
      };

      installPhase = ''
        install -Dm644 FreePatsGM-Percussion-*.sf2 $out/share/soundfonts/FreePatsGM-Percussion.sf2
      '';

      meta = with lib; {
      description = "General MIDI percussion soundfont";
      homepage = "https://freepats.zenvoid.org/SoundSets/gm-percussion-set.html";
      license = licenses.gpl3FreepatsPlus;
      platforms = platforms.all;
      maintainers = with maintainers; [  ];
    };
  };
}
