{ pkgs, ... }:
{
  services.minecraft-server = {
    enable = true;
    eula = true;
    openFirewall = true;
    package = pkgs.minecraftServers.vanilla-1-12;

    serverProperties = {
      server-port = 25565;
      gamemode = "survival";
      difficulty = "normal";
      max-players = 2;
      motd = "Мой сервер";
      online-mode = true;
    };
  };
}
