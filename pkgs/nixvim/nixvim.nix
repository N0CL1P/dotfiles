{ ... }:
{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    colorschemes.tokyonight = {
      enable = true;
      settings.style = "night";
    };

    opts = {
      number = true;
      relativenumber = true;
      cursorline = true;
      shiftwidth = 4;
    };

    autoCmd = [
      {
        event = [ "BufWritePre" ];
        callback = {
          __raw = ''
            function()
              vim.lsp.buf.format({
                async = false,
                filter = function(client)
                  return client.name == "null-ls"
                end
              })
            end
          '';
        };
      }
    ];

    keymaps = [
      # LSP
      {
        key = "gd";
        action = "<cmd>lua vim.lsp.buf.definition()<CR>";
        options.desc = "Go to definition";
      }
      {
        key = "K";
        action = "<cmd>lua vim.lsp.buf.hover()<CR>";
        options.desc = "Hover docs";
      }
      {
        key = "<leader>rn";
        action = "<cmd>lua vim.lsp.buf.rename()<CR>";
        options.desc = "Rename";
      }
      {
        key = "<leader>ca";
        action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
        options.desc = "Code action";
      }
      # Telescope
      {
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<CR>";
        options.desc = "Find files";
      }
      {
        key = "<leader>fg";
        action = "<cmd>Telescope live_grep<CR>";
        options.desc = "Live grep";
      }
      {
        key = "<leader>fb";
        action = "<cmd>Telescope buffers<CR>";
        options.desc = "Buffers";
      }
    ];

    plugins = {
      # LSP
      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
          zls.enable = true;
          lua-language-server = true;
          rust_analyzer.rustc = true;
          rust_analyzer.cargo = true;
        };
      };

      none-ls = {
        enable = true;
        sources.formatting.nixfmt.enable = true;
      };

      # Подсветка синтаксиса
      treesitter = {
        enable = true;
        settings.highlight.enable = true;
      };

      # Автодополнение
      cmp = {
        enable = true;
        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "buffer"; }
            { name = "path"; }
          ];
          mapping = {
            "<Tab>" = "cmp.mapping.select_next_item()";
            "<S-Tab>" = "cmp.mapping.select_prev_item()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<C-Space>" = "cmp.mapping.complete()";
          };
        };
      };

      # Fuzzy finder
      telescope.enable = true;

      # Автоскобки
      nvim-autopairs.enable = true;

      # Git
      gitsigns.enable = true;

      # UI
      lualine.enable = true;
      web-devicons.enable = true;
    };
  };
}
