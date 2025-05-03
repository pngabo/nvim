require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

-- EXAMPLE
local servers = { "html", "cssls", "ts_ls", "tailwindcss", "gopls", "pyright" }
local nvlsp = require "nvchad.configs.lspconfig"

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf_request(0, "workspace/executeCommand", params, function(err, _, _)
    if err then
      vim.notify("Error organizing imports: " .. (err.message or tostring(err)), vim.log.levels.ERROR)
      return
    end
  end)
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
        staticcheck = true,
      },
    },
  },
}

for _, lsp in ipairs(servers) do
  local config = lsp_configs[lsp] or {}
  lspconfig[lsp].setup(vim.tbl_deep_extend("force", {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }, config))
end
