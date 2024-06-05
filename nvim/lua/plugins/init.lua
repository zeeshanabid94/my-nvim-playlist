plugins = {
	-- Fuzzy finder
	{
    		"nvim-telescope/telescope.nvim", tag = "0.1.6",
		-- or                              , branch = "0.1.x",
      		dependencies = { "nvim-lua/plenary.nvim" }
    	},
	-- Theme for the eyes
	{
  		"folke/tokyonight.nvim",
  		lazy = false,
  		priority = 1000,
  		opts = {},
	},
	-- Tree sitter for syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		cmd = "TSUpdate"
	},
	-- Harpoon for quick links to files
	{
    		"ThePrimeagen/harpoon",
    		branch = "harpoon2",
    		dependencies = { "nvim-lua/plenary.nvim" }
	},
	-- Coc for LSP goodness
	{
		"neoclide/coc.nvim",
		branch = "release",
		build = ":CocInstall coc-json coc-tsserver coc-rust-analyzer coc-sumneko-lua"
	},
	-- Undo tree so that I don't have to hate myself while trying to undo my changes
	{
		"mbbill/undotree"
	},
	-- Git plugin
	{
		"tpope/vim-fugitive"
	},
    -- File tree
    {
        "nvim-tree/nvim-tree.lua"
    },
    -- Dev icons for some pretty visuals
    {
        "nvim-tree/nvim-web-devicons"
    },
    {
        "airblade/vim-gitgutter"
    },
    {
        "Bekaboo/dropbar.nvim"
    },
    {
        "nvim-lualine/lualine.nvim"
    }
}

