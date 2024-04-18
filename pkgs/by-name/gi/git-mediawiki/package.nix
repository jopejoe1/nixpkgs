{ lib
, stdenv
, fetchFromGitHub
, perl
}:

let
  sharness = fetchFromGitHub {
    owner = "felipec";
    repo = "sharness";
    rev = "e94c6bbb04e8772eb9dd587aee3b721c9b01d282";
    hash = "sha256-hkweQkiR2FU5jaMpNkT83tcyfJ4Ciz2v6tvUrXZJiy4=";
  };
in
stdenv.mkDerivation {
  pname = "git-mediawiki";
  version = "0-unstable-2022-03-10";

  src = fetchFromGitHub {
    owner = "Git-Mediawiki";
    repo = "Git-Mediawiki";
    rev = "73da25d20690cc78e479088a6c0968762411ad41";
    hash = "sha256-8o1v4soHYSKCHDF4YN8/+8aq6YsvR4d1n7oHevYtIow=";
  };

  postPatch = ''
    rm -r t/sharness
    ln -s ${sharness} t/sharness
  '';

  env.PREFIX = placeholder "out";

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
