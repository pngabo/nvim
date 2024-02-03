function ColorMyPencils(color)
  -- color = "github_dark" or color
  color = "darcula" or color
  -- color = "catppuccin" or color
  -- color = "kanagawa" or color
  -- color = "rose-pine" or color
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
