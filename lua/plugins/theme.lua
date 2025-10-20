return {
	{
		"navarasu/onedark.nvim",
		commit = "de495fabe171d48aed5525f002d14414efcecbb2",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("onedark").setup({
				style = "darker",
				transparent = true,
			})
			-- Enable theme
			require("onedark").load()
		end,
	},
}
