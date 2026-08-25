{ config, ... }:
{
  programs.noctalia = {
    enable = true;
    systemd.enable = true;

    settings = {
      theme = {
        community_palette = "Breeze";
        custom_palette = "noctalia-wallpaper-mo";
        mode = "dark";
        source = "custom";

        templates.builtin_ids = [
          "foot"
          "helix"
          "niri"
          "starship"
          "btop"
          "qt"
          "gtk3"
          "gtk4"
        ];
      };

      wallpaper = {
        enabled = false;
        default.path = "../../wallpapers";
      };

      location = {
        auto_locate = true;
      };

      bar = {
        order = "default";

        default = {
          start = [ "workspaces" ];

          center = [
            "clock"
            "media"
          ];

          end = [
            "tray"
            "notifications"
            "clipboard"
            "bluetooth"
            "volume"
            "brightness"
            "battery"
            "session"
          ];

          margin_ends = 0;
          radius = 0;
          thickness = 20;
          concave_edge_corners = false;
          shadow = false;

        };
      };

      shell.panel = {
        shadow = false;
      };

      lockscreen = {
        blurred_desktop = true;
        fingerprint = false;
      };
    };
  };

  home.file.".config/noctalia/palettes".source = config.lib.file.mkOutOfStoreSymlink ./palettes;
}
