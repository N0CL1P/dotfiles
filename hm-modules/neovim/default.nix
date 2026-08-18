{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    sideloadInitLua = true;

    plugins = with pkgs.vimPlugins; [
      vim-code-dark
      nvim-treesitter
      blink-cmp
      nvim-autopairs
      telescope-nvim
      telescope-fzf-native-nvim
      gitsigns-nvim
      conform-nvim
      lualine-nvim
      multicursor-nvim
      which-key-nvim

      (nvim-treesitter.withPlugins (
        p: with p; [
          lua
          nix
          c
          cpp
          rust
        ]
      ))
    ];

    extraPackages = with pkgs; [
      nixd
      lua-language-server
      clang-tools
      rust-analyzer

      nixfmt
      stylua
      rustfmt

      tree-sitter
    ];
  };
}
