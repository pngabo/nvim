local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local options = {
  server = {
    on_attach = on_attach,
    capabilitties = capabilities,
  },
}
return options
