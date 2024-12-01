return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "leoluz/nvim-dap-go",
    },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      require("dapui").setup()
      require("dap-go").setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      vim.keymap.set(
        "n",
        "<leader>db",
        dap.toggle_breakpoint,
        { desc = "Add breakpoint at line" }
      )
      vim.keymap.set(
        "n",
        "<leader>dr",
        dap.continue,
        { desc = "Run or continue the debugger" }
      )
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "configs.rust-tools"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },
  {
    "saecki/crates.nvim",
    dependencies = "hrsh7th/nvim-cmp",
    ft = { "rust", "toml" },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      crates.show()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "nvchad.configs.cmp"
      local cmp = require "cmp" -- Add this line to require 'cmp'
      -- Insert new source 'crates'
      table.insert(M.sources, { name = "crates" })

      -- Add entry filter to remove 'Text' completion kind
      -- Configure Enter to confirm selection
      M.mapping = {
        ["<CR>"] = cmp.mapping.confirm { select = true }, -- Confirm completion on Enter
      }

      -- Filter out 'Text' type completions in the entries
      M.sorting = {
        comparators = {
          function(entry1, entry2)
            -- If entry1 or entry2 is of kind 'Text', deprioritize or remove it
            local kind1 = entry1:get_kind()
            local kind2 = entry2:get_kind()

            if kind1 == 1 then -- 1 corresponds to 'Text' kind in nvim-cmp
              return false
            elseif kind2 == 1 then
              return true
            end
            -- Otherwise, fallback to default sorting
            return nil
          end,
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.score,
          cmp.config.compare.recently_used,
          cmp.config.compare.locality,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      }

      return M
    end,
  },
  {
    "tpope/vim-fugitive",
    event = "BufRead", -- Load plugin when a buffer is read
  },
  {
    "sindrets/diffview.nvim",
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = true,
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    opts = function()
      return require "configs.null-ls"
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "typescript",
      "typescriptreact",
      "html",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup {}
    end,
  },
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = function()
      require("flutter-tools").setup {
        debugger = {
          -- make these two params true to ennable debug mode
          enabled = false,
          run_via_dap = false,
          register_configurations = function(_)
            require("dap").adapters.dart = {
              type = "executable",
              command = vim.fn.stdpath "data"
                .. "/mason/bin/dart-debug-adapter",
              args = { "flutter" },
            }
            require("dap").configurations.dart = {
              {
                type = "dart",
                request = "launch",
                name = "Launch flutter",
                darkSdkPath = "home/flutter/bin/cache/dart-sdk",
                flutterSdkPath = "home/workspace/flutter",
                program = "${workspaceFolder}/lib/main.dart",
                cwd = "${workspaceFolder}",
              },
            }
            -- uncomment below line if you've launch.json file already in your vscode setup
            -- require("dap.ext.vscode").load_launchjs()
          end,
        },
        dev_log = {
          -- toggle it when you run without DAP
          enabled = false,
          open_cmd = "tabedit",
        },
      }
    end,
  },
  -- for dart syntax hightling
  {
    "dart-lang/dart-vim-plugin",
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "typescript-language-server",
        "js-debug-adapter",
        "tailwindcss-language-server",
        "pyright",
        "gopls",
        "json-lsp",
        "html-lsp",
        "css-lsp",
        "cssmodules-language-server",
        "css-variables-language-server",
        "prettier",
        "eslint-lsp",
        "eslint_d",
        "rust-analyzer",
        "sonarlint-language-server",
        "dockerfile-language-server",
        "docker-compose-language-server",
        "nginx-language-server",
        "yaml-language-server",
        "json-lsp",
        "stylelint-lsp",
        "emmet-ls",
        "cmake-language-server",
        "buf-language-server",
        "bash-language-server",
        "ansible-language-server",
        "go-debug-adapter",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "typescript",
        "tsx",
        "rust",
        "python",
        "vim",
        "lua",
        "go",
        "graphql",
        "dockerfile",
        "vimdoc",
        "html",
        "css",
        "yaml",
        "tmux",
      },
    },
  },
}
