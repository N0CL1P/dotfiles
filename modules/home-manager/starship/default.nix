{ ... }:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    presets = [
      "nerd-font-symbols"
    ];

    settings = {
      add_newline = false;
      character = {
        success_symbol = "#";
        error_symbol = "#";
      };
    };
  };
}
