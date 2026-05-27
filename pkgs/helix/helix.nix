{ pkgs, ... }:
{
  programs.helix = {
    enable = true;
    settings = {
      theme = "dark_plus";
      editor = {
        line-number = "relative";
        bufferline = "multiple";
        color-modes = true;
        true-color = true;
        rulers = [120];
        auto-format = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        indent-guides = {
          render = true;
        };
      };
    };
    languages = {
      language = [
        {
          name = "nix";
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
    ];
  };
}
