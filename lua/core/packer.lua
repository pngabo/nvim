-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use("nvim-tree/nvim-tree.lua")
	use("nvim-tree/nvim-web-devicons")
	use("nvim-lualine/lualine.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({
		"Exafunction/codeium.nvim",
		config = function()
			require("codeium").setup({})
		end,
	})
	-- use("nvim-telescope/telescope-file-browser.nvim")
	-- use({
	--   "doums/darcula",
	--   as = "darcula",
	--   config = function()
	--     vim.cmd("colorscheme darcula")
	--   end,
	-- })
	-- use({
	--   "pngabo/darcula-solid",
	--   as = "darcula-solid",
	--   requires = "rktjmp/lush.nvim",
	--   config = function()
	--     vim.cmd("colorscheme darcula-solid")
	--   end,
	-- })
	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			vim.cmd("colorscheme catppuccin")
		end,
	})

	-- use({
	--   "xiantang/darcula-dark.nvim",
	--   as = "darcula-dark",
	--   config = function()
	--     vim.cmd("colorscheme darcula-dark")
	--   end,
	-- })
	use("brenoprata10/nvim-highlight-colors")
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use("nvim-treesitter/playground")
	use("ThePrimeagen/harpoon")
	use("mbbill/undotree")
	use("tpope/vim-fugitive")
	use("FabijanZulj/blame.nvim")
	--tmux & split window navigator
	use("christoomey/vim-tmux-navigator")
	use("szw/vim-maximizer") -- maximizes and restores the current windows
	use("tpope/vim-surround") -- surround the selected text with e.g: '', "",() etc
	use("vim-scripts/ReplaceWithRegister")
	-- Commenting with gc
	use("numToStr/Comment.nvim")
	use({ "fgheng/winbar.nvim" })
	use({ "akinsho/bufferline.nvim", tag = "*" })
	-- prettier
	use("neovim/nvim-lspconfig")
	use("nvimtools/none-ls.nvim")
	use("MunifTanjim/prettier.nvim")
	use("folke/todo-comments.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional
			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
	})
end)
