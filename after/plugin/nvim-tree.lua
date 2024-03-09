-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()
-- nvim-tree explorer
vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<CR>")
