{ pkgs, ... }:
{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    colorschemes.vscode.enable = true;

    extraPackages = with pkgs; [
      tree-sitter
      nixfmt
      rustfmt
      stylua
      ruff
    ];

    opts = {
      number = true;
      relativenumber = true;
      cursorline = true;
      signcolumn = "yes";
      termguicolors = true;
      shiftwidth = 4;
      tabstop = 4;
      expandtab = true;
      scrolloff = 8;
      wrap = false;
      swapfile = false;
      undofile = true;
      timeoutlen = 300;
      updatetime = 250;
      ignorecase = true;
      smartcase = true;
      splitbelow = true;
      splitright = true;
      smoothscroll = true;
      clipboard = "unnamedplus";
    };

    keymaps = [
      {
        key = "<C-s>";
        action = "<cmd>w<CR>";
      }
      {
        key = "<C-h>";
        action = "<C-w>h";
      }
      {
        key = "<C-j>";
        action = "<C-w>j";
      }
      {
        key = "<C-k>";
        action = "<C-w>k";
      }
      {
        key = "<C-l>";
        action = "<C-w>l";
      }
      {
        key = "<Esc>";
        action = "<C-\\><C-n>";
        mode = [ "t" ];
      }
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
        key = "<leader>fd";
        action = "<cmd>Telescope diagnostics<CR>";
        options.desc = "Diagnostics";
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
      {
        key = "]c";
        action = "<cmd>Gitsigns next_hunk<CR>";
        options.desc = "Next hunk";
      }
      {
        key = "[c";
        action = "<cmd>Gitsigns prev_hunk<CR>";
        options.desc = "Prev hunk";
      }
      {
        key = "<leader>hs";
        action = "<cmd>Gitsigns stage_hunk<CR>";
        options.desc = "Stage hunk";
      }
      {
        key = "<leader>hp";
        action = "<cmd>Gitsigns preview_hunk<CR>";
        options.desc = "Preview hunk";
      }
      {
        key = "<C-t>";
        action = "<cmd>ToggleTerm<CR>";
        mode = [
          "n"
          "t"
        ];
      }
      {
        key = "s";
        action = "<cmd>lua require('flash').jump()<CR>";
        mode = [
          "n"
          "x"
          "o"
        ];
      }
      {
        key = "S";
        action = "<cmd>lua require('flash').treesitter()<CR>";
        mode = [
          "n"
          "x"
          "o"
        ];
      }
      {
        key = "<leader>tl";
        action = "<cmd>lua require('lsp_lines').toggle()<CR>";
        options.desc = "Toggle lsp-lines";
      }
    ];

    diagnostics = {
      virtual_lines = true;
      virtual_text = false;
      signs = true;
      underline = true;
      update_in_insert = false;
      severity_sort = true;
      float = {
        border = "rounded";
        source = "always";
        header = "";
      };
    };

    plugins = {
      lsp = {
        enable = true;
        keymaps = {
          lspBuf = {
            gd = "definition";
            gr = "references";
            K = "hover";
            "<leader>rn" = "rename";
            "<leader>ca" = "code_action";
            "<leader>D" = "type_definition";
          };
        };
        servers = {
          nixd = {
            enable = true;
            settings = {
              nixd = {
                nixpkgs = {
                  expr = "(builtins.getFlake \"/etc/nixos\").inputs.nixpkgs.legacyPackages.x86_64-linux";
                };

                options = {
                  nixos = {
                    expr = "(builtins.getFlake \"/etc/nixos\").nixosConfigurations.nixos-btw.options";
                  };
                  home_manager = {
                    expr = "(builtins.getFlake \"/etc/nixos\").nixosConfigurations.nixos-btw.config.home-manager.users.mollan";
                  };
                };
                formatting = {
                  command = [ "nixfmt" ];
                };
              };
            };
          };
          zls.enable = true;
          lua_ls.enable = true;
          clangd.enable = true;
          rust_analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
          };
        };
      };

      treesitter = {
        enable = true;
        settings.highlight.enable = true;
        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          nix
          rust
          zig
          lua
          python
          cpp
          c
          css
          json
          yaml
          toml
          markdown
          markdown_inline
          bash
          zsh
        ];
      };

      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            timeout_ms = 500;
            lsp_fallback = true;
          };
          formatters_by_ft = {
            nix = [ "nixfmt" ];
            rust = [ "rustfmt" ];
            zig = [ "zigfmt" ];
            lua = [ "stylua" ];
            python = [ "ruff_format" ];
            cpp = [ "clang_format" ];
          };
        };
      };

      blink-cmp = {
        enable = true;

        settings = {
          keymap = {
            preset = "super-tab";
          };

          appearance = {
            nerd_font_variant = "mono";
            use_nvim_cmp_as_default = true;
          };

          completion = {
            menu = {
              auto_show = true;
            };
            documentation = {
              auto_show = true;
              auto_show_delay_ms = 300;
            };
            ghost_text = {
              enabled = true;
            };
          };

          sources = {
            default = [
              "lsp"
              "snippets"
              "path"
              "buffer"
            ];

            providers = {
              lsp = {
                score_offset = 1000;
              };
              snippets = {
                score_offset = 750;
              };
              path = {
                score_offset = 650;
              };
              buffer = {
                score_offset = 500;
                max_items = 5;
              };
            };
          };

          snippets = {
            preset = "luasnip";
          };
        };
      };

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

      mini = {
        enable = true;
        modules = {
          icons = { };
          starter = { };
          surround = {
            mappings = {
              add = "gsa";
              delete = "gsd";
              find = "gsf";
              find_left = "gsF";
              highlight = "gsh";
              replace = "gsr";
              update_n_lines = "gsn";
            };
          };
          comment = {
            mappings = {
              comment = "gc";
              comment_line = "gcc";
              comment_visual = "gc";
              textobject = "gc";
            };
          };
          move = { };
        };
      };

      telescope = {
        enable = true;
        extensions = {
          fzf-native.enable = true;
          ui-select.enable = true;
        };
      };

      toggleterm = {
        enable = true;
        settings = {
          direction = "float";
          float_opts.border = "curved";
        };
      };

      illuminate = {
        enable = true;
        settings.delay = 300;
      };

      gitsigns = {
        enable = true;
        settings.current_line_blame = true;
      };

      lsp-lines.enable = true;

      flash.enable = true;

      nvim-autopairs.enable = true;

      indent-blankline.enable = true;

      fidget.enable = true;

      luasnip.enable = true;

      which-key = {
        enable = true;
        settings = {
          spec = [
            {
              __unkeyed-1 = "gc";
              group = "Comment";
              mode = [
                "n"
                "x"
                "o"
              ];
            }
            {
              __unkeyed-1 = "gs";
              group = "Surround";
              mode = [
                "n"
                "x"
                "o"
              ];
            }
          ];
        };
      };

      lualine.enable = true;

      web-devicons.enable = true;

      todo-comments.enable = true;
    };

    extraConfigLua = ''
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function()
          for _, key in ipairs({ "grn", "grr", "gra", "gri", "grt", "grx" }) do
            pcall(vim.keymap.del, "n", key)
          end
        end,
      })
    '';
  };
}
