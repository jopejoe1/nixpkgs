{
  lib,
  stdenv,
  fetchFromGitHub,
  gitUpdater,
  cmake,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "xbyak";
  version = "7.07";

  src = fetchFromGitHub {
    owner = "herumi";
    repo = "xbyak";
    rev = "v${finalAttrs.version}";
    hash = "sha256-FP4VXH6pIQkUpLIlPni7XaKsFKE+xrhA0sInGQqq12M=";
  };

  nativeBuildInputs = [
    cmake
  ];

  passthru.updateScript = gitUpdater { rev-prefix = "v"; };

  meta = with lib; {
    description = "JIT assembler for x86(IA-32)/x64(AMD64, x86-64) MMX/SSE/SSE2/SSE3/SSSE3/SSE4/FPU/AVX/AVX2/AVX-512 by C++ header";
    homepage = "https://github.com/herumi/xbyak";
    license = licenses.bsd3;
    maintainers = with maintainers; [ jopejoe1 ];
    platforms = platforms.x86;
  };
})
