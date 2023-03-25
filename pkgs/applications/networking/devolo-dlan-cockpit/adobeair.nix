{ lib
, stdenv
, fetchurl
, dpkg
, pkgsi686Linux
}:

stdenv.mkDerivation rec {
  pname = "adobeair";
  version = "2.6.0.19170-devolo1";

  src = if (stdenv.hostPlatform.system == "i686-linux") then fetchurl {
    url = "http://update.devolo.com/linux/apt/pool/main/a/${pname}/${pname}_${version}_i386.deb";
    sha256 = "918d6a73c33a2934ad8c3a61b2a93a19d6dff99b06a966fe5941a0688f958229";
  } else fetchurl {
    url = "http://update.devolo.com/linux/apt/pool/main/a/${pname}/${pname}_${version}_amd64.deb";
    sha256 = "e9de65e7934ee413af29e1e9f5ddd39a61ca6b30585709692b418d9dc7193a50";
  };

  dontBuild = true;

  unpackPhase = "dpkg -x $src ./";

  meta = with lib; {
    description = "Adobe AIR 2 distibuted by devolo";
    #license = licenses.unfree;
    maintainers = with maintainers; [ ];
    platforms = [ "x86_64-linux" "i686-linux" ];
  };
}
