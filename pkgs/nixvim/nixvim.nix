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
      completeopt = "menu,menuone,noselect";
    };

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
      {
        key = "<leader>xx";
        action = "<cmd>Trouble diagnostics toggle<CR>";
        options.desc = "Open trouble";
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
          surround = { };
          comment = { };
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

      nvim-autopairs.enable = true;

      indent-blankline.enable = true;

      fidget.enable = true;

      illuminate.enable = true;

      luasnip.enable = true;

      gitsigns.enable = true;

      which-key.enable = true;

      trouble.enable = true;

      lualine.enable = true;

      web-devicons.enable = true;

      todo-comments.enable = true;
    };
  };
}
