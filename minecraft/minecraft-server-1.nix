{ ... }:
{
  services.minecraft-server = {
    enable = true;
    eula = true;
    openFirewall = true;

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
