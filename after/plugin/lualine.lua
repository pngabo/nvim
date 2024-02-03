require("lualine").setup({
  options = {
    theme = "darcula",
    icons_enabled = true,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
  },
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    treesitter = true,
    markdown = true,
    telescope = true,
  },
})
