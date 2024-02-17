vim.g.mapleader = " "
-- netrw explorer
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- nvim-tree explorer
vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<CR>")

vim.keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=") -- make split window equal width
vim.keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- switch between windows
vim.keymap.set('n', '<C-h>', '<C-w>h') -- go left
vim.keymap.set('n', '<C-j>', '<C-w>j') -- go down
vim.keymap.set('n', '<C-l>', '<C-w>l') -- go right

-- Move text up and down normal mode
vim.keymap.set("n", "<leader>mj", ":tabnew<CR>")
vim.keymap.set("n", "<leader>mk", ":tabclose<CR>")

-- Move text up and down visual mode
vim.keymap.set("v", "<leader>mj", ":tabnew<CR>")
vim.keymap.set("v", "<leader>mk", ":tabclose<CR>")

vim.keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

--plugin keymaps

-- vim-maximizer
vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- maximizes and restores window to the original size
vim.keymap.set("n", "==", vim.lsp.buf.format, {}) -- code formatter
