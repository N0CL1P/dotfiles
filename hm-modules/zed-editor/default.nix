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
      "qml"
      "scss"
      "glsl"
      "yuck"
      "jetbrains-themes"
    ];
    userSettings = {
      theme = "JetBrains Islands Dark";
      telemetry = {
        metrics = false;
        diagnostics = false;
      };
      helix_mode = true;
      relative_line_numbers = "enabled";
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
