return {
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
}
