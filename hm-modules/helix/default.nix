{ pkgs, ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "dark_plus";
      keys.normal = {
        "A-j" = [
          "extend_to_line_bounds"
          "delete_selection"
          "paste_after"
        ];
        "A-k" = [
          "extend_to_line_bounds"
          "delete_selection"
          "move_line_up"
          "paste_before"
        ];
      };
      keys.select = {
        "A-j" = [
          "extend_to_line_bounds"
          "delete_selection"
          "paste_after"
        ];
        "A-k" = [
          "extend_to_line_bounds"
          "delete_selection"
          "move_line_up"
          "paste_before"
        ];
      };
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
          display-color-swatches = true;
        };
      };
    };
    languages = {
      language-server = {
        tailwindcss-language-server = {
          command = "tailwindcss-language-server";
          args = [ "--stdio" ];
        };
        vscode-css-language-server = {
          command = "vscode-css-language-server";
          args = [ "--stdio" ];
        };
        vscode-html-language-server = {
          command = "vscode-html-language-server";
          args = [ "--stdio" ];
        };
      };
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = "nixfmt";
          language-servers = [ "nixd" ];
        }
        {
          name = "css";
          auto-format = true;
          language-servers = [
            "vscode-css-language-server"
            "tailwindcss-language-server"
          ];
        }
        {
          name = "scss";
          auto-format = true;
          language-servers = [
            "vscode-css-language-server"
            "tailwindcss-language-server"
          ];
        }
        {
          name = "html";
          auto-format = true;
          language-servers = [
            "vscode-html-language-server"
            "tailwindcss-language-server"
          ];
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
      pkgs.prettier
      pkgs.vscode-langservers-extracted
      pkgs.tailwindcss-language-server
      pkgs.glsl_analyzer
      pkgs.bash-language-server
      pkgs.marksman
    ];
  };
}
