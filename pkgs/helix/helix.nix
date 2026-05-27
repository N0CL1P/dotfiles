{ pkgs, ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "dark_plus";
      editor = {
        line-number = "relative";
        bufferline = "multiple";
        color-modes = true;
        true-color = true;
        rulers = [ 120 ];
        auto-format = true;
        search.smart-case = true;
        file-picker.hidden = false;
        indent-guides.render = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        whitespace.render = {
          tab = "all";
          newline = "none";
        };
        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };
      };
    };
    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = "nixfmt";
          };
        }
      ];
    };
    extraPackages = [
      pkgs.nixd
      pkgs.nixfmt
      pkgs.clang-tools
      pkgs.zls
      pkgs.rust-analyzer
      pkgs.ruff
      pkgs.lua-language-server
      pkgs.taplo
      pkgs.glsl_analyzer
      pkgs.bash-language-server
      pkgs.marksman
    ];
  };
}
