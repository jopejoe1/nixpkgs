{
  stdenv,
  fetchurl,
  discord,
}:

(discord.override {
  binaryName = if stdenv.isDarwin then "Discord Development" else "DiscordDevelopment";
  desktopName = "Discord Development";
  pname = "discord-development";
}).overrideAttrs
  (
    finalAttrs: previousAttrs: {
      version = if stdenv.isDarwin then "0.0.31" else "0.0.16";
      src =
        if stdenv.isDarwin then
          fetchurl {
            url = "https://dl-development.discordapp.net/apps/osx/${finalAttrs.version}/DiscordDevelopment.dmg";
            hash = "sha256-He/9KH1oMyj9ofYSwHhdqm7jKDsvrGpPPjLED9fSq30=";
          }
        else
          fetchurl {
            url = "https://dl-development.discordapp.net/apps/linux/${finalAttrs.version}/discord-development-${finalAttrs.version}.tar.gz";
            hash = "sha256-6QImWsNmL2JveB2QJ1MyBxkVEQfdPvKEdenRPjURptI=";
          };
    }
  )
