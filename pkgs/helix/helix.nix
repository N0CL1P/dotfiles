{ ... }:
{
  programs.helix = {
    enable = true;
    settings = {
      theme = "dark_plus";
      editor = {
        auto-completion = true;
        auto-format = true;
        line-number = "relative";
        lsp = {
          enable = true;
          display-messages = true;
          auto-signature-help = true;
        };
        cursor-shape = {
          normal = "bar";
          insert = "bar";
          select = "bar";
        };
      };
    };
  };
}
