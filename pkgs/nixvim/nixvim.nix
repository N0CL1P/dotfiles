{ pkgs, ... }:
{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    colorschemes.vscode.enable = true;

    extraPackages = with pkgs; [
      tree-sitter
      ripgrep
      fd
    ];

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
      {
        key = "-";
        action = "<cmd>Oil<CR>";
        options.desc = "Open oil";
      }
      {
        key = "<leader>-";
        action = "<cmd>Oil --float<CR>";
        options.desc = "Open oil (float)";
      }
    ];

    plugins = {
      lsp = {
        enable = true;
        keymaps = {
          lspBuf = {
            gd = "definition";
            K = "hover";
            "<leader>rn" = "rename";
            "<leader>ca" = "code_action";
          };
        };
        servers = {
          nixd.enable = true;
          zls.enable = true;
          lua_ls.enable = true;
          rust_analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
          };
        };
      };

      none-ls = {
        enable = true;
        sources.formatting.nixfmt.enable = true;
      };

      treesitter = {
        enable = true;
        settings.highlight.enable = true;
        grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
      };

      cmp = {
        enable = true;
        autoEnableSources = true;
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

      telescope.enable = true;

      nvim-autopairs.enable = true;

      gitsigns.enable = true;

      lualine.enable = true;

      web-devicons.enable = true;

      oil = {
        enable = true;
        settings = {
          view_options.show_hidden = true;
          delete_to_trash = true;
          lsp_file_method.autosave_changes = true;
          buf_options = {
            buflisted = true;
            bufhidden = "hide";
          };
          float = {
            padding = 2;
            max_width = 80;
            max_height = 30;
          };
        };
      };
    };
  };
}
