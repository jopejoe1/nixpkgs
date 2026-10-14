{
  fetchFromGitHub,
  lib,
  stdenv,
  fontforge,
  perl,
  perlPackages,
  installFonts,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "dejavu-fonts";
  version = "2.37";
  nativeBuildInputs = [
    fontforge
    perl
    perlPackages.IOString
    perlPackages.FontTTF
    installFonts
  ];

  src = fetchFromGitHub {
    owner = "dejavu-fonts";
    repo = "dejavu-fonts";
    rev = "version_${lib.replaceStrings [ "." ] [ "_" ] finalAttrs.version}";
    sha256 = "1xknlg2h287dx34v2n5r33bpcl4biqf0cv7nak657rjki7s0k4bk";
  };

  buildFlags = [ "full-ttf" ];

  preBuild = "patchShebangs scripts";

  installPhase = ''
    runHook preInstall
    runHook postInstall
  '';

  meta = {
    description = "Typeface family based on the Bitstream Vera fonts";
    longDescription = ''
      The DejaVu fonts are TrueType fonts based on the BitStream Vera fonts,
      providing more styles and with greater coverage of Unicode.

      This package includes DejaVu Sans, DejaVu Serif, DejaVu Sans Mono, and
      the DejaVu Math TeX Gyre font.
    '';
    homepage = "https://dejavu-fonts.github.io/";

    # Copyright (c) 2003 by Bitstream, Inc. All Rights Reserved.
    # Copyright (c) 2006 by Tavmjong Bah. All Rights Reserved.
    # DejaVu changes are in public domain
    # See http://dejavu-fonts.org/wiki/License for details
    license = lib.licenses.free;

    platforms = lib.platforms.all;
  };
})
