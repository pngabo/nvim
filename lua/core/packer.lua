-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
  'rose-pine/neovim', as = 'rose-pine',
  config = function()
    require('rose-pine').setup({
      bold = false,
      italic = {
        strings= false,
        comments = true,
        operators = false,
        folds = false
      },
      constrast = 'hard',
      transparent_mode = true
    })

    vim.cmd('colorscheme rose-pine')
  end
})

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('ThePrimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  --tmux & split window navigator
  use('christoomey/vim-tmux-navigator')
  use('szw/vim-maximizer') -- maximizes and restores the current windows
  use('tpope/vim-surround') -- surround the selected text with e.g: '', "",() etc
  use('vim-scripts/ReplaceWithRegister')
  -- Commenting with gc
  use('numToStr/Comment.nvim')

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v2.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {                                      -- Optional
		  'williamboman/mason.nvim',
		  run = function()
			  pcall(vim.cmd, 'MasonUpdate')
		  end,
	  },
	  {'williamboman/mason-lspconfig.nvim'}, -- Optional

	  -- Autocompletion
	  {'hrsh7th/nvim-cmp'},     -- Required
	  {'hrsh7th/cmp-nvim-lsp'}, -- Required
	  {'L3MON4D3/LuaSnip'},     -- Required
  }
}
end)
