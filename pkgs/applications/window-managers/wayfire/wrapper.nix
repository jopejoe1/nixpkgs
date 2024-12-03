{ symlinkJoin, lib, makeWrapper, wayfire, plugins ? [ ] }:

symlinkJoin {
  pname = "wayfire-wrapped";
  inherit (wayfire) version;

  nativeBuildInputs = [ makeWrapper ];

  paths = [
    wayfire
  ] ++ plugins;

  postBuild = ''
    for binary in $out/bin/*; do
      wrapProgram $binary \
        --prefix WAYFIRE_PLUGIN_PATH : $out/lib/wayfire \
        --prefix WAYFIRE_PLUGIN_XML_PATH : $out/share/wayfire/metadata
    done
  '';

  preferLocalBuild = true;

  passthru = wayfire.passthru // {
    unwrapped = wayfire;
  };

  meta = wayfire.meta // {
    # To prevent builds on hydra
    hydraPlatforms = [];
    # prefer wrapper over the package
    priority = (wayfire.meta.priority or lib.meta.defaultPriority) - 1;
  };
}
