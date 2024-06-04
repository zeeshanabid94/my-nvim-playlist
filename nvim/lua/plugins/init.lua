plugins = {
	{
    		"nvim-telescope/telescope.nvim", tag = "0.1.6",
		-- or                              , branch = "0.1.x",
      		dependencies = { "nvim-lua/plenary.nvim" }
    	},
	{
  		"folke/tokyonight.nvim",
  		lazy = false,
  		priority = 1000,
  		opts = {},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		cmd = "TSUpdate"
	},
	{
    		"ThePrimeagen/harpoon",
    		branch = "harpoon2",
    		dependencies = { "nvim-lua/plenary.nvim" }
	},
	{
		"neoclide/coc.nvim",
		branch = "release",
		build = ":CocInstall coc-json coc-tsserver coc-rust-analyzer"
	}
}

