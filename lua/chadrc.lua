-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    Normal = { bg = "#000000" },      -- Sets 'base' color
    NormalNC = { bg = "#000000" },    -- Sets 'mantle' color
    NormalFloat = { bg = "#000000" }, -- Sets 'crust' color,
  },
}

return M
