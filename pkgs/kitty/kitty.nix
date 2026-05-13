{ ... }:
{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 14.0;
    };

    settings = {
      cursor_shape = "beam";
      cursor_blink_interval = "0.6 ease-in-out";
      cursor_stop_blinking_after = 0;
      cursor_trail = 1;
      cursor_trail_decay = "0.1 0.37";
      cursor_trail_start_threshold = 4;

      repaint_delay = 6;
      input_delay = 1;
      sync_to_monitor = "yes";

      enable_audio_bell = "no";

      window_margin_width = 8;
      single_window_margin_width = 0;

      tab_bar_style = "powerline";

      dynamic_background_opacity = "yes";
      background_opacity = "0.69";
      background_blur = 10;

      foreground = "#d4d4d4";
      background = "#1e1e1e";
      selection_foreground = "#ffffff";
      selection_background = "#264f78";

      cursor = "#a6a6a6";
      cursor_text_color = "#1e1e1e";

      url_color = "#75beff";

      active_border_color = "#007acc";
      inactive_border_color = "#323232";
      bell_border_color = "#cca700";

      active_tab_foreground = "#ffffff";
      active_tab_background = "#007acc";
      inactive_tab_foreground = "#d4d4d4";
      inactive_tab_background = "#252526";
      tab_bar_background = "#1e1e1e";

      mark1_foreground = "#1e1e1e";
      mark1_background = "#569CD6";
      mark2_foreground = "#1e1e1e";
      mark2_background = "#4EC9B0";
      mark3_foreground = "#1e1e1e";
      mark3_background = "#DCDCAA";

      # black
      color0 = "#1e1e1e";
      color8 = "#858585";
      # red
      color1 = "#f14c4c";
      color9 = "#ff1212";
      # green
      color2 = "#6A9955";
      color10 = "#487e02";
      # yellow
      color3 = "#d7ba7d";
      color11 = "#cca700";
      # blue
      color4 = "#007acc";
      color12 = "#569CD6";
      # magenta / purple
      color5 = "#C586C0";
      color13 = "#9CDCFE";
      # cyan
      color6 = "#4EC9B0";
      color14 = "#75beff";
      # white
      color7 = "#d4d4d4";
      color15 = "#ffffff";
    };
  };
}
