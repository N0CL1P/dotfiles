{ ... }:
{
  programs.ghostty = {
    enable = true;
    systemd.enable = true;
    enableZshIntegration = true;

    settings = {
      font-family = "JetBrainsMono Nerd Font";
      font-size = 14;
      background-opacity = 0.86;
      theme = "vscode-dark";
    };

    themes = {
      "vscode-dark" = {
        foreground = "#d4d4d4";
        background = "#1e1e1e";
        selection-foreground = "#ffffff";
        selection-background = "#264f78";
        cursor-color = "#a6a6a6";
        cursor-text = "#1e1e1e";

        palette = [
          "0=#1e1e1e" # black
          "8=#858585" # bright black
          "1=#f14c4c" # red
          "9=#ff1212" # bright red
          "2=#6A9955" # green
          "10=#487e02" # bright green
          "3=#d7ba7d" # yellow
          "11=#cca700" # bright yellow
          "4=#007acc" # blue
          "12=#569CD6" # bright blue
          "5=#C586C0" # magenta
          "13=#9CDCFE" # bright magenta
          "6=#4EC9B0" # cyan
          "14=#75beff" # bright cyan
          "7=#d4d4d4" # white
          "15=#ffffff" # bright white
        ];
      };
    };
  };
}
