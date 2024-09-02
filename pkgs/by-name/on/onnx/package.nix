{
  lib,
  stdenv,
  fetchFromGitHub,
  gitUpdater,
  cmake,
  pkg-config,
  python3Packages,
  protobuf,
}:

let
  python = python3Packages.python.withPackages (ps: with ps; [
    pybind11
    ps.protobuf
  ]);
in
stdenv.mkDerivation (finalAttrs: {
  pname = "onnx";
  version = "1.16.2";

  src = fetchFromGitHub {
    owner = "onnx";
    repo = "onnx";
    rev = "v${finalAttrs.version}";
    hash = "sha256-JmxnsHRrzj2QzPz3Yndw0MmgZJ8MDYxHjuQ7PQkQsDg=";
  };

  cmakeFlags = [
    (lib.cmakeBool "ONNX_USE_PROTOBUF_SHARED_LIBS" (!stdenv.hostPlatform.isStatic))
    (lib.cmakeBool "BUILD_SHARED_LIBS" (!stdenv.hostPlatform.isStatic))
    (lib.cmakeBool "ONNX_USE_LITE_PROTO" true)
  ];

  nativeBuildInputs = [
    cmake
    pkg-config
    python
  ];

  buildInputs = [
    protobuf
  ];

  outputs = [
    "out"
    "dev"
  ];

  passthru.updateScript = gitUpdater { rev-prefix = "v"; };

  meta = with lib; {
    description = "Open standard for machine learning interoperability";
    homepage = "https://onnx.ai/";
    license = licenses.asl20;
    maintainers = with maintainers; [ jopejoe1 ];
    platforms = platforms.all;
  };
})
