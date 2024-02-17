require("telescope").setup({
  defaults = {
    sorting_strategy = "ascending",
    layout_config = {
      prompt_position = "top",
      horizontal = {
        preview_width = 0.5,
        results_width = 0.8,
      },
    },
  },
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.git_files, { desc = "Find Git Files" })
vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fd", builtin.lsp_document_symbols, {})
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Find Old Files" })
vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find Word under Cursor" })
vim.keymap.set("n", "<leader>fi", "<cmd>AdvancedGitSearch<CR>", { desc = "AdvancedGitSearch" })
vim.keymap.set("n", "<leader>fc", builtin.git_commits, { desc = "Search Git Commits" })
vim.keymap.set("n", "<leader>gb", builtin.git_bcommits, { desc = "Search Git Commits for Buffer" })
-- vim.keymap.set(
--   "n",
--   "<leader>fc",
--   '<cmd>lua require("telescope.builtin").live_grep({ glob_pattern = "!{spec,test}"})<CR>',
--   { desc = "Live Grep Code" }
-- )
vim.keymap.set("n", "<leader>gp", function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
