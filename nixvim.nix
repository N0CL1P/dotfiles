{ ... }:
{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    colorschemes.tokyonight = {
      enable = true;
      settings = {
        style = "night";
      };
    };
    opts = {
      number = true;
      relativenumber = true;
      cursorline = true;
      shiftwidth = 4;
    };
    plugins.lsp = {
      enable = true;
      servers = {
        nixd.enable = true; # рекомендуется
      };
    };
    plugins.none-ls = {
      enable = true;
      sources = {
        formatting.nixfmt.enable = true;
      };
    };
    autoCmd = [
      {
        event = "BufWritePre";
        pattern = "*.nix";
        command = "lua vim.lsp.buf.format()";
      }
    ];
    plugins.cmp = {
      enable = true;
      settings = {
        sources = [
          { name = "nvim_lsp"; } # подсказки от LSP
          { name = "buffer"; } # слова из текущего буфера
          { name = "path"; } # пути к файлам
        ];
        mapping = {
          "<Tab>" = "cmp.mapping.select_next_item()";
          "<S-Tab>" = "cmp.mapping.select_prev_item()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<C-Space>" = "cmp.mapping.complete()";
        };
      };
    };
    plugins.lualine.enable = true;
  };
}
