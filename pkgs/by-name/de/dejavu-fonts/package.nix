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
    tag = "version_${lib.replaceStrings [ "." ] [ "_" ] finalAttrs.version}";
    hash = "sha256-c5EJ9IlT5lPMVPZsBhyOi1B21xi5WLHJ6O0gAcWjdvY=";
  };

  buildFlags = [ "full-ttf" ];

  postPatch = ''
    patchShebangs scripts
  '';

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
    license = with lib.licenses; AND [
      bitstreamVera
      publicDomain
    ];

    platforms = lib.platforms.all;
  };
})
