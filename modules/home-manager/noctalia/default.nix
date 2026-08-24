{ ... }:
{
  programs.noctalia = {
    enable = true;
    systemd.enable = true;

    settings = {
      theme = {
        builtin = "Catppuccin";
        community_palette = "Breeze";
        mode = "dark";
        source = "community";
      };

      wallpaper = {
        enabled = false;
        default.path = "../../wallpapers";
      };
    };
  };
}
