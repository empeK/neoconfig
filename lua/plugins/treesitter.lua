return {
	{
		"nvim-treesitter/nvim-treesitter",
		commit = "42fc28ba918343ebfd5565147a42a26580579482",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs", -- Sets main module to use for opts
		opts = {
			ensure_installed = {
				"lua",
				"javascript",
				"typescript",
				"vimdoc",
				"vim",
				"regex",
				"sql",
				"dockerfile",
				"json",
				"gitignore",
				"graphql",
				"yaml",
				"markdown",
				"markdown_inline",
				"bash",
				"tsx",
				"css",
				"html",
				"c_sharp",
			},
			auto_install = true,
			highlight = {
				enable = true,
			},
			indent = { enable = true },
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter" },
		config = function()
			require("nvim-treesitter.configs").setup({
				textobjects = {
					move = {
						enable = true,
						set_jumps = false,
						goto_next_start = {
							["]f"] = "@function.outer",
							["]]"] = { query = "@class.outer", desc = "Next class start" },
						},
						goto_next_end = {
							["]F"] = "@function.outer",
							["]["] = "@class.outer",
						},
						goto_previous_start = {
							["[f"] = "@function.outer",
							["[["] = "@class.outer",
						},
						goto_previous_end = {
							["[F"] = "@function.outer",
							["[]"] = "@class.outer",
						},
					},
				},
			})
		end,
	},
}
