{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
}:

let
  camkeInstall = ''
    set(BOOST_CONFIG_INCLUDE_DIR "''${CMAKE_CURRENT_SOURCE_DIR}/include")

    install(
      TARGETS boost_config
      EXPORT BoostConfigTargets
    )

    install(
      EXPORT BoostConfigTargets
      FILE BoostConfigTargets.cmake
      NAMESPACE Boost::
      DESTINATION lib/cmake/boost_config
    )

    install(
      DIRECTORY include/
      DESTINATION include
    )
  '';
in
stdenv.mkDerivation (finalAttrs: {
  pname = "boost-config";
  version = "1.86.0";

  src = fetchFromGitHub {
    owner = "boostorg";
    repo = "config";
    rev = "refs/tags/boost-${finalAttrs.version}";
    hash = "sha256-hjSIhUV3e3Kc4XRZJ5D8cWuY6FuaDIKJ+GOKyBCzQ6I=";
  };

  postPatch = ''
    echo "${camkeInstall}" > CMakeLists.txt
  '';

  nativeBuildInputs = [
    cmake
  ];

  postBuild = ''
    ls .
  '';

  meta = with lib; {
    homepage = "http://boost.org/libs/config";
    license = lib.licenses.boost;
    platforms = platforms.unix;
    maintainers = with maintainers; [ jopejoe1 ];
  };
})
