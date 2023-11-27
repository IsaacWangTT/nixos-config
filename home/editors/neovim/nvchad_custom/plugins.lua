local plugins = {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"python",
				"nix",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"nvimtools/none-ls.nvim",
			config = function()
				require("custom.configs.null-ls")
			end,
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
	{
		"xiyaowong/transparent.nvim",
		lazy = false,
		opts = {
			extra_groups = {
				"NvimTreeNormal",
				"NvimTreeStatuslineNc",
			},
		},
	},
}

return plugins
