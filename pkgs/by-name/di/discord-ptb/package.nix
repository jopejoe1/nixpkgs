{
  stdenv,
  fetchurl,
  discord,
}:

(discord.override {
  binaryName = if stdenv.isDarwin then "Discord PTB" else "DiscordPTB";
  desktopName = "Discord PTB";
  pname = "discord-ptb";
}).overrideAttrs
  (
    finalAttrs: previousAttrs: {
      version = if stdenv.isDarwin then "0.0.102" else "0.0.76";
      src =
        if stdenv.isDarwin then
          fetchurl {
            url = "https://dl-ptb.discordapp.net/apps/osx/${finalAttrs.version}/DiscordPTB.dmg";
            hash = "sha256-33x6M++EsRJXTbsC4BCa21Yz7cbAhsosPO1WqYq/lCY=";
          }
        else
          fetchurl {
            url = "https://dl-ptb.discordapp.net/apps/linux/${finalAttrs.version}/discord-ptb-${finalAttrs.version}.tar.gz";
            hash = "sha256-Gj6OLzkHrEQ2CeEQpICaAh1m13DpM2cpNVsebBJ0MVc=";
          };
    }
  )
