{ lib
, stdenv
, fetchFromGitHub
, perl
}:

stdenv.mkDerivation {
  pname = "git-mediawiki";
  version = "0-unstable-2022-03-10";

  src = fetchFromGitHub {
    owner = "Git-Mediawiki";
    repo = "Git-Mediawiki";
    rev = "73da25d20690cc78e479088a6c0968762411ad41";
    hash = "";
    fetchSubmodules = true;
  };

  #sourceRoot = "${src.name}/contrib/mw-to-git";

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
