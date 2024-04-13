-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
				use {
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
	-- or                            , branch = '0.1.x',
	requires = { {'nvim-lua/plenary.nvim'} }
	}

	use ({
		"EdenEast/nightfox.nvim",
		as = "nightfox",
	        config = function()
        		vim.cmd("colorscheme nightfox")
        	end
        })

	use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use ('theprimeagen/harpoon')
	use ('mbbill/undotree')    
	use("kdheepak/lazygit.nvim")
	use('francoiscabrol/ranger.vim')
	use('rbgrouleff/bclose.vim')
end)
