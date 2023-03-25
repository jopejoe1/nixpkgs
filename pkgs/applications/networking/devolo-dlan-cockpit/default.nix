{ lib
, stdenv
, fetchurl
, dpkg
, xdg-utils
}:

stdenv.mkDerivation rec {
  pname = "devolo-dlan-cockpit";
  version = "5.2.0.185-0";

  src = if (stdenv.hostPlatform.system == "i686-linux") then fetchurl {
    url = "http://update.devolo.com/linux/apt/pool/main/d/${pname}/${pname}_${version}_i386.deb";
    sha256 = "243744e7bc4e017c178e3fa76d5c5b38c88a15a51a0bf15babb48f76f87bb68d";
  } else fetchurl {
    url = "http://update.devolo.com/linux/apt/pool/main/d/${pname}/${pname}_${version}_amd64.deb";
    sha256 = "b888531e5a16313218635fd76049b1149bbc9d6e047f5e01a09e6f204c171495";
  };

  dontBuild = true;
  dontUnpack = true;
  dontStrip = true;

  installPhase = ''
    ${dpkg}/bin/dpkg -x $src $out

    mv $out/opt/devolo/dlancockpit/bin $out
    mv $out/usr/bin/* $out/bin

    rm -r $out/usr/bin
    rm -r $out/etc/cron.daily

    substituteInPlace $out/bin/dlancockpit-run.sh \
      --replace .appdata "~/.appdata" \
      --replace /opt/devolo/dlancockpit/bin/dlancockpit "$out/bin/dlancockpit" \
      --replace xdg-open "${xdg-utils}/bin/xdg-open"

    substituteInPlace $out/usr/share/applications/devolo-dlan-cockpit.desktop \
      --replace /opt/devolo/dlancockpit/bin/dlancockpit-run.sh "dlancockpit-run.sh" \

    echo "StartupWMClass=dlancockpit" >> $out/usr/share/applications/devolo-dlan-cockpit.desktop
  '';



  meta = with lib; {
    description = "Display and configure settings of your devolo device";
    homepage = "https://www.devolo.global/devolo-cockpit";
    #license = licenses.unfree;
    maintainers = with maintainers; [ ];
    platforms = [ "x86_64-linux" "i686-linux" ];
  };
}
