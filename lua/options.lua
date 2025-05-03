require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt ='both' -- to enable cursorline!
o.nu = true
o.relativenumber = true

o.backspace = "2"
o.autoindent = true
o.autowrite = true
o.autoread = true

-- use spaces for tabs
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.shiftround = true
o.expandtab = true
o.smartindent = true
o.scrolloff = 8
o.colorcolumn = "80"
o.wrap = true
o.linebreak = true

vim.g.dap_virtual_text = true
