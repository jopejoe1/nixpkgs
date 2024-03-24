{
  stdenv,
  fetchurl,
  discord,
}:

(discord.override {
  binaryName = if stdenv.isDarwin then "Discord Canary" else "DiscordCanary";
  desktopName = "Discord Canary";
  pname = "discord-canary";
}).overrideAttrs
  (
    finalAttrs: previousAttrs: {
      version = if stdenv.isDarwin then "0.0.435" else "0.0.323";
      src =
        if stdenv.isDarwin then
          fetchurl {
            url = "https://dl-canary.discordapp.net/apps/osx/${finalAttrs.version}/DiscordCanary.dmg";
            hash = "sha256-Jreet8EstaTAYAmQrzRaJE/b+xwgRVXIW8elEY7amvw=";
          }
        else
          fetchurl {
            url = "https://dl-canary.discordapp.net/apps/linux/${finalAttrs.version}/discord-canary-${finalAttrs.version}.tar.gz";
            hash = "sha256-jhfg66zd5oADT84RDdoBXp8n9xGd1jNaX8hDRnJKFK0=";
          };
    }
  )
