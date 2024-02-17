function ColorMyPencils(color)
  color = "darcula" or color
  -- color = "catppuccin" or color
  -- color = "rose-pine" or color
  -- color = "darcula-dark" or color
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
