{
  lib,
  buildDotnetModule,
  fetchFromGitHub,
  dotnetCorePackages,
}:

buildDotnetModule (finalAttrs: {
  pname = "archisteamfarm-freepackages";
  version = "1.6.3.2";

  src = fetchFromGitHub {
    owner = "Citrinate";
    repo = "FreePackages";
    tag = finalAttrs.version;
    hash = "sha256-gaBjsWH8EmY2tRtvKVDvIPwjgua3S/K6lpBlYdygi/E=";
    fetchSubmodules = true;
  };

  nugetDeps = ./deps.json;

  dotnet-runtime = dotnetCorePackages.aspnetcore_10_0;
  dotnet-sdk = dotnetCorePackages.sdk_10_0;

  projectFile = "FreePackages/FreePackages.csproj";
  testProjectFile = "FreePackages.Tests/FreePackages.Tests.csproj";

  postInstall = ''
    find $out -type f | grep -Pv "FreePackages" | xargs -d"\n" rm
    find $out -empty -type d -delete
  '';

  meta = {
    description = "ASF plugin for finding and redeeming free Steam games";
    license = lib.licenses.asl20;
    maintainers = [ lib.maintainers.jopejoe1 ];
  };
})
