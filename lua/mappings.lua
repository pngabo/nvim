require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Move text up and down visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "J", "mzJ`z")

-- cursor stays in middle whilejumping up/down
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- cursor stays in the middle while searching
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "<leader>vwm", function()
  require("vim-with-me").StartVimWithMe()
end)
map("n", "<leader>svwm", function()
  require("vim-with-me").StopVimWithMe()
end)

map("x", "<leader>p", [["_dP]])

-- yank to the system's clipboard
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

map("n", "Q", "<nop>")

map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

map("n", "<C-k>", "<cmd>cnext<CR>zz")
map("n", "<C-j>", "<cmd>cprev<CR>zz")
map("n", "<leader>k", "<cmd>lnext<CR>zz")
map("n", "<leader>j", "<cmd>lprev<CR>zz")

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- make file executable
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

map("n", "<leader>sv", "<C-w>v")     -- split window vertically
map("n", "<leader>sh", "<C-w>s")     -- split window horizontally
map("n", "<leader>se", "<C-w>=")     -- make split window equal width
map("n", "<leader>sx", ":close<CR>") -- close current split window

-- switch between windows
map("n", "<C-h>", "<C-w>h")             -- go left
map("n", "<C-j>", "<C-w>j")             -- go down
map("n", "<C-l>", "<C-w>l")             -- go right

map("n", "<leader>to", ":tabnew<CR>")   -- open new tab
map("n", "<leader>tx", ":tabclose<CR>") -- close current tab
map("n", "<leader>tn", ":tabn<CR>")     -- go to next tab
map("n", "<leader>tp", ":tabp<CR>")     -- go to previous tab

--plugin keymaps

-- vim-maximizer
map("n", "<leader>sm", ":MaximizerToggle<CR>") -- maximizes and restores window to the original size
map("n", "==", vim.lsp.buf.format, {})

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<leader>co", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

-- telescope
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Telescope Live grep" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Telescope Find files" })
map(
  "n",
  "<leader>fp",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "Telescope Find all files" }
)

-- Gitsisigns
map("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
