{ lib
, stdenv
, fetchgit
, perl
}:

stdenv.mkDerivation rec {
  pname = "git-mediawiki";
  version = "0-unstable-2023-12-09";

  src = fetchgit {
    url = "https://git.kernel.org/pub/scm/git/git.git";
    rev = "1ef1cce9c254d3787586ac87c1d1a2ca2c00bfd3";
    hash = "sha256-3GY42QoZOguEob6FfaDBFleFs9XufTufLW5vZzRLn3Y=";
    sparseCheckout = [
      "contrib/mw-to-git"
    ];
  };

  sourceRoot = "${src.name}/contrib/mw-to-git";

  buildInputs = [
    perl
    perl.pkgs.MediaWikiAPI
    perl.pkgs.DateTimeFormatISO8601
    perl.pkgs.LWPProtocolHttps
  ];

  meta = with lib; {
    description = "Git Clone a MediaWiki";
    homepage = "https://github.com/Git-Mediawiki/Git-Mediawiki";
    license = licenses.gpl2Only;
    maintainers = with maintainers; [ jopejoe1 ];
    platforms = platforms.all;
  };
}
