return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
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
        "go-debug-adapter",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "typescript",
        "tsx",
        "jsdoc",
        "json",
        "python",
        "go",
        "gowork",
        "gomod",
        "gosum",
        "dockerfile",
        "yaml",
        "tmux",
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    opts = function()
      return require "custom.configs.none-ls"
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
    "tpope/vim-fugitive",
    event = "BufRead", -- Load plugin when a buffer is read
  },
  {
    "sindrets/diffview.nvim",
  },
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {},
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
      "leoluz/nvim-dap-go",
    },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      require("dapui").setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
      vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Add breakpoint at line" })
      vim.keymap.set("n", "<leader>dr", dap.continue, { desc = "Run or continue the debugger" })
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "custom.configs.dap"
    end,
  },
  {
    "github/copilot.vim",
    lazy = false,
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
}
