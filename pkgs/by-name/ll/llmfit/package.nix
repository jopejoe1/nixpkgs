{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "llmfit";
  version = "0.1.9";

  src = fetchFromGitHub {
    owner = "AlexsJones";
    repo = "llmfit";
    tag = "v${finalAttrs.version}";
    sha256 = "sha256-Pp68JwTwcP1uNJGbLZK9DbmKlpNixjCQvPkIlnx53JE=";
  };

  cargoHash = "sha256-hgeq2E9APaNdlB2z6QdH1i5jFhclezXj3Ai/Y1QfQFY=";

  meta = {
    description = "Find what runs on your hardware";
    homepage = "https://github.com/AlexsJones/llmfit";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [
      matthiasbeyer
    ];
    mainProgram = "llmfit";
  };
})
