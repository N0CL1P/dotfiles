{ ... }:
{
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        term = "xterm-256color";
        font = "JetBrainsMono Nerd Font:size=14";
        dpi-aware = "no";
        pad = "8x8";
      };

      cursor = {
        style = "beam";
        blink = "yes";
      };

      colors-dark = {
        alpha = "0.86";
        foreground = "d4d4d4";
        background = "1e1e1e";

        cursor = "1e1e1e a6a6a6";

        selection-foreground = "ffffff";
        selection-background = "264f78";
        urls = "75beff";

        regular0 = "1e1e1e";
        regular1 = "f14c4c";
        regular2 = "6A9955";
        regular3 = "d7ba7d";
        regular4 = "007acc";
        regular5 = "C586C0";
        regular6 = "4EC9B0";
        regular7 = "d4d4d4";

        bright0 = "858585";
        bright1 = "ff1212";
        bright2 = "487e02";
        bright3 = "cca700";
        bright4 = "569CD6";
        bright5 = "9CDCFE";
        bright6 = "75beff";
        bright7 = "ffffff";
      };
    };
  };
}
