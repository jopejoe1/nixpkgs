{
  writeText,
  lib,
  stdenv,
  path,
  pkgsToCheck ? (import path {
    system = stdenv.system;
    config = {
      # Aliases throm a lot of warings
      allowAliases = false;
      # Also Eval broken, unfree and insecure packages
      allowBroken = true;
      allowUnfree = true;
      allowUnsupportedSystem = true;
      allowInsecurePredicate = x: true;
    };
  }) // {
    mkCheckpointedBuild = null;
    buildNeovimPluginFrom2Nix = null;
    rustPlatform = null;
    package-info = true;
  },
  excludedAttrs ? {
    # Filter out recoursions
    __splicedPackages = true;
    pkgsBuildBuild = true;
    pkgsBuildHost = true;
    pkgsBuildTarget = true;
    pkgsHostHost = true;
    pkgsHostTarget = true;
    pkgsTargetTarget = true;
    buildPackages = true;
    targetPackages = true;
    pkgsLLVM = true;
    pkgsMusl = true;
    pkgsStatic = true;
    pkgsCross = true;
    pkgsx86_64Darwin = true;
    pkgsi686Linux = true;
    pkgsLinux = true;
    pkgsExtraHardening = true;
    pkgsArocc = true;
    pkgsZig = true;
    pkgs = true;
    scope = true;
    gitAndTools = true;

    # Fails to eval
    config = true;

    # Takes up most of the eval time
    haskell = true;

    # Too Much log spam
    lib = true;

    # filter out self
    package-info = true;
  },
}:

let
  results =
    path: value:
    let
      attempt =
        lib.warn "Missing meta: ${lib.concatStringsSep "." path}" (if (lib.isDerivation value) then
          [
            {
              name = lib.concatStringsSep "." path;
              value = {
                inherit (value)
                  name
                  ;
                version = value.version or null; #(lib.warn "Missing version: ${lib.concatStringsSep "." path}" null);
                pname = value.pname or null; #(lib.warn "Missing pname: ${lib.concatStringsSep "." path}" null);
                outputs = value.outputs or null; #(lib.warn "Missing outputs: ${lib.concatStringsSep "." path}" null);
                system = value.system or null; #(lib.warn "Missing system: ${lib.concatStringsSep "." path}" null);
                outputName = value.outputName or null; #(lib.warn "Missing outputName: ${lib.concatStringsSep "." path}" null);
                meta = value.meta or null; #(lib.warn "Missing meta: ${lib.concatStringsSep "." path}" null);
                #tests = if lib.isDerivation (value.tests or {}) then (lib.warn "Tests is an Attrset: ${lib.concatStringsSep "." path}" false) else true;
              };
            }
          ]
        else if !(lib.isAttrs value) then
          [ ]
        else if (value.__attrsFailEvaluation or false) then
          [ ]
        else
          lib.pipe value [
            (lib.mapAttrs (
              name: innerValue:
              if excludedAttrs."${name}" or (lib.elem name path) then
                []#(lib.warn "Missing outputName: ${lib.concatStringsSep "." (path ++ [ name ])}" []) #[ ]
              else ((results (path ++ [ name ]) innerValue))
            ))
            lib.attrValues
            lib.concatLists
          ]);

      seq = builtins.deepSeq attempt attempt;
      tried = builtins.tryEval seq;
      result = if tried.success then tried.value else [ ];
    in
    result;
  json = builtins.toJSON ({
    version = 2;
    packages = lib.listToAttrs (results [ ] pkgsToCheck);
  });
in
writeText "package.json" json
