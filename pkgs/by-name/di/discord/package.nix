{
  autoPatchelfHook,
  fetchurl,
  lib,
  makeDesktopItem,
  makeShellWrapper,
  makeWrapper,
  runCommand,
  stdenv,
  wrapGAppsHook,
  writeScript,

  binaryName ? "Discord",
  desktopName ? "Discord",
  pname ? "discord",

  withOpenASAR ? false,
  openasar,
  withTTS ? true,
  speechd,
  withVencord ? false,
  vencord,

  alsa-lib,
  at-spi2-atk,
  at-spi2-core,
  atk,
  cairo,
  cups,
  dbus,
  expat,
  fontconfig,
  freetype,
  gdk-pixbuf,
  glib,
  gtk3,
  libX11,
  libXScrnSaver,
  libXcomposite,
  libXcursor,
  libXdamage,
  libXext,
  libXfixes,
  libXi,
  libXrandr,
  libXrender,
  libXtst,
  libappindicator-gtk3,
  libcxx,
  libdbusmenu,
  libdrm,
  libglvnd,
  libnotify,
  libpulseaudio,
  libunity,
  libuuid,
  libxcb,
  libxshmfence,
  mesa,
  nspr,
  nss,
  pango,
  python3,
  systemd,
  undmg,
  wayland,
}:

let
  disableBreakingUpdates =
    runCommand "disable-breaking-updates.py"
      {
        pythonInterpreter = "${python3.interpreter}";
        configDirName = lib.toLower binaryName;
        meta.mainProgram = "disable-breaking-updates.py";
      }
      ''
        mkdir -p $out/bin
        cp ${./disable-breaking-updates.py} $out/bin/disable-breaking-updates.py
        substituteAllInPlace $out/bin/disable-breaking-updates.py
        chmod +x $out/bin/disable-breaking-updates.py
      '';
  meta = with lib; {
    description = "All-in-one cross-platform voice and text chat for gamers";
    homepage = "https://discordapp.com/";
    downloadPage = "https://discordapp.com/download";
    sourceProvenance = with sourceTypes; [ binaryNativeCode ];
    license = licenses.unfree;
    maintainers = with maintainers; [
      MP2E
      Scrumplex
      artturin
      infinidoge
      jopejoe1
    ];
    platforms = [
      "x86_64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];
    mainProgram = binaryName;
  };
in
(
  if stdenv.isDarwin then
    stdenv.mkDerivation (finalAttrs: {
      inherit pname meta;

      version = "0.0.296";

      src = fetchurl {
        url = "https://dl.discordapp.net/apps/osx/${finalAttrs.version}/Discord.dmg";
        hash = "sha256-0bSyL/J2P1pVzv9pFTNSR3V2NkQcDTd74t8KT+WVd64=";
      };

      nativeBuildInputs = [
        undmg
        makeWrapper
      ];

      sourceRoot = ".";

      installPhase = ''
        runHook preInstall

        mkdir -p $out/Applications
        cp -r "${desktopName}.app" $out/Applications

        # wrap executable to $out/bin
        mkdir -p $out/bin
        makeWrapper "$out/Applications/${desktopName}.app/Contents/MacOS/${binaryName}" "$out/bin/${binaryName}"

        runHook postInstall
      '';

      postInstall =
        lib.strings.optionalString withOpenASAR ''
          cp -f ${openasar} $out/Applications/${desktopName}.app/Contents/Resources/app.asar
        ''
        + lib.strings.optionalString withVencord ''
          mv $out/Applications/${desktopName}.app/Contents/Resources/app.asar $out/Applications/${desktopName}.app/Contents/Resources/_app.asar
          mkdir $out/Applications/${desktopName}.app/Contents/Resources/app.asar
          echo '{"name":"discord","main":"index.js"}' > $out/Applications/${desktopName}.app/Contents/Resources/app.asar/package.json
          echo 'require("${vencord}/patcher.js")' > $out/Applications/${desktopName}.app/Contents/Resources/app.asar/index.js
        '';

      passthru = {
        updateScript = writeScript "discord-update-script" ''
          #!/usr/bin/env nix-shell
          #!nix-shell -i bash -p curl gnugrep common-updater-scripts
          set -x
          set -eou pipefail;
          url=$(curl -sI "https://discordapp.com/api/download/${
            builtins.replaceStrings
              [
                "discord-"
                "discord"
              ]
              [
                ""
                "stable"
              ]
              pname
          }?platform=osx&format=dmg" | grep -oP 'location: \K\S+')
          version=''${url##https://dl*.discordapp.net/apps/osx/}
          version=''${version%%/*.dmg}
          update-source-version ${
            lib.optionalString (!stdenv.buildPlatform.isDarwin) "pkgsCross.aarch64-darwin."
          }${pname} "$version" --file=./pkgs/by-name/di/${pname}/package.nix
        '';
      };
    })
  else
    stdenv.mkDerivation (finalAttrs: {
      inherit pname meta;

      version = "0.0.46";

      src = fetchurl {
        url = "https://dl.discordapp.net/apps/linux/${finalAttrs.version}/discord-${finalAttrs.version}.tar.gz";
        hash = "sha256-uGHDZg4vu7rUJce6SSVbuLRBPEHXgN4oocAQY+Dqdaw=";
      };

      nativeBuildInputs = [
        alsa-lib
        autoPatchelfHook
        cups
        libdrm
        libuuid
        libXdamage
        libX11
        libXScrnSaver
        libXtst
        libxcb
        libxshmfence
        mesa
        nss
        wrapGAppsHook
        makeShellWrapper
      ];

      dontWrapGApps = true;

      libPath = lib.makeLibraryPath (
        [
          libcxx
          systemd
          libpulseaudio
          libdrm
          mesa
          stdenv.cc.cc
          alsa-lib
          atk
          at-spi2-atk
          at-spi2-core
          cairo
          cups
          dbus
          expat
          fontconfig
          freetype
          gdk-pixbuf
          glib
          gtk3
          libglvnd
          libnotify
          libX11
          libXcomposite
          libunity
          libuuid
          libXcursor
          libXdamage
          libXext
          libXfixes
          libXi
          libXrandr
          libXrender
          libXtst
          nspr
          libxcb
          pango
          libXScrnSaver
          libappindicator-gtk3
          libdbusmenu
          wayland
        ]
        ++ lib.optional withTTS speechd
      );

      installPhase = ''
        runHook preInstall

        mkdir -p $out/{bin,opt/${binaryName},share/pixmaps,share/icons/hicolor/256x256/apps}
        mv * $out/opt/${binaryName}

        chmod +x $out/opt/${binaryName}/${binaryName}
        patchelf --set-interpreter ${stdenv.cc.bintools.dynamicLinker} \
            $out/opt/${binaryName}/${binaryName}

        wrapProgramShell $out/opt/${binaryName}/${binaryName} \
            "''${gappsWrapperArgs[@]}" \
            --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform=wayland --enable-features=WaylandWindowDecorations}}" \
            ${lib.strings.optionalString withTTS "--add-flags \"--enable-speech-dispatcher\""} \
            --prefix XDG_DATA_DIRS : "${gtk3}/share/gsettings-schemas/${gtk3.name}/" \
            --prefix LD_LIBRARY_PATH : ${finalAttrs.libPath}:$out/opt/${binaryName} \
            --run "${lib.getExe disableBreakingUpdates}"

        ln -s $out/opt/${binaryName}/${binaryName} $out/bin/
        # Without || true the install would fail on case-insensitive filesystems
        ln -s $out/opt/${binaryName}/${binaryName} $out/bin/${lib.strings.toLower binaryName} || true

        ln -s $out/opt/${binaryName}/discord.png $out/share/pixmaps/${pname}.png
        ln -s $out/opt/${binaryName}/discord.png $out/share/icons/hicolor/256x256/apps/${pname}.png

        ln -s "$desktopItem/share/applications" $out/share/

        runHook postInstall
      '';

      postInstall =
        lib.strings.optionalString withOpenASAR ''
          cp -f ${openasar} $out/opt/${binaryName}/resources/app.asar
        ''
        + lib.strings.optionalString withVencord ''
          mv $out/opt/${binaryName}/resources/app.asar $out/opt/${binaryName}/resources/_app.asar
          mkdir $out/opt/${binaryName}/resources/app.asar
          echo '{"name":"discord","main":"index.js"}' > $out/opt/${binaryName}/resources/app.asar/package.json
          echo 'require("${vencord}/patcher.js")' > $out/opt/${binaryName}/resources/app.asar/index.js
        '';

      desktopItem = makeDesktopItem {
        name = pname;
        exec = binaryName;
        icon = pname;
        inherit desktopName;
        genericName = meta.description;
        categories = [
          "Network"
          "InstantMessaging"
        ];
        mimeTypes = [ "x-scheme-handler/discord" ];
      };

      passthru = {
        # make it possible to run disableBreakingUpdates standalone
        inherit disableBreakingUpdates;
        updateScript = writeScript "discord-update-script" ''
          #!/usr/bin/env nix-shell
          #!nix-shell -i bash -p curl gnugrep common-updater-scripts
          set -eou pipefail;
          url=$(curl -sI "https://discordapp.com/api/download/${
            builtins.replaceStrings
              [
                "discord-"
                "discord"
              ]
              [
                ""
                "stable"
              ]
              pname
          }?platform=linux&format=tar.gz" | grep -oP 'location: \K\S+')
          version=''${url##https://dl*.discordapp.net/apps/linux/}
          version=''${version%%/*.tar.gz}
          update-source-version ${pname} "$version" --file=./pkgs/by-name/di/${pname}/default.nix
        '';
      };
    })
)
