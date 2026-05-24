{ ... }:
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "zig"
      "lua"
      "html"
      "toml"
      "glsl"
    ];
    userSettings = {
      telemetry = {
        metrics = false;
        diagnostics = false;
      };
      vim_mode = true;
      vim = {
        toggle_relative_line_numbers = true;
      };
      ui_font_family = ".ZedSans";
      buffer_font_family = "JetBrainsMono Nerd Font";
      terminal = {
        font_family = "JetBrainsMono Nerd Font";
      };
      ui_font_size = 16;
      buffer_font_size = 16;
      project_panel = {
        dock = "left";
      };
    };
  };
}
