{ lib
, stdenv
, fetchurl
, dpkg
}:

stdenv.mkDerivation rec {
  pname = "devolo-dlan-cockpit";
  version = "5.2.0.185";

  src = fetchurl {
    url = "https://www.devolo.global/fileadmin/Web-Content/DE/products/hnw/devolo-cockpit/software/devolo-cockpit-v5-2-0-185-linux.run";
    sha256 = "sha256-l2CZtapHhe3Jzqu2JGq+ckt40ucX0ZBuuRvxN/WFoeY=";
  };

  dontUnpack = true;
  dontBuild = true;
  dontStrip = true;

  installPhase = ''
    skip=$(grep -a -m1 -n "HERE_BE_DRAG[O]NS" $src | cut -d: -f1)
    tail $src -n +$((skip+1)) | tar -x -C .
  '' + (if stdenv.isi686 then ''
    ${dpkg}/bin/dpkg -x devolo-dlan-cockpit_${version}-0_i386.deb $out
    ${dpkg}/bin/dpkg -x adobeair*i386.deb $out
  '' else ''
    ${dpkg}/bin/dpkg -x devolo-dlan-cockpit_${version}-0_amd64.deb $out
    ${dpkg}/bin/dpkg -x adobeair*amd64.deb $out
  '');

  meta = with lib; {
    description = "Display and configure settings of your devolo device";
    homepage = "https://www.devolo.global/devolo-cockpit";
    #license = licenses.unfree;
    maintainers = with maintainers; [ ];
    platforms = [ "x86_64-linux" "i686-linux" ];
  };
}
