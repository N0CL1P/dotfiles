{ pkgs, ... }:
{
  services.minecraft-servers = {
    enable = true;
    eula = true;

    servers."horror-plus-1.20.1" = {
      enable = true;
      package = pkgs.fabricServers.fabric-1_20_1;

      jvmOpts = "-Xms2G -Xmx6G -XX:+UseG1GC";

      serverProperties = {
        server-port = 25565;
        gamemode = "survival";
        difficulty = "hard";
        max-players = 10;
        motd = "The Horrors in the Fog";
        online-mode = true;
      };

      symlinks = {
        mods = "/srv/minecraft-1.19.2/horror-plus-fabric";
      };
    };
  };
}
