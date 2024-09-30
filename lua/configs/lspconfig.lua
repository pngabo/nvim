-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"
local servers = {
  "ts_ls",
  "rust_analyzer",
  "html",
  "cssls",
  "tailwindcss",
  "gopls",
  "pyright",
}

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end

local lsp_configs = {
  ts_ls = {
    init_options = {
      preferences = {
        disableSuggestions = true,
      },
    },
    commands = {
      OrganizeImports = {
        organize_imports,
        description = "organize Imports",
      },
    },
  },
  pyright = {
    filetypes = { "python" },
  },
  gopls = {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
      gopls = {
        completeUnimported = true,
        usePlaceholders = true,
        analyses = {
          unusedparams = true,
        },
      },
    },
  },
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup(vim.tbl_extend("force", {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }, lsp_configs[lsp] or {}))
end
