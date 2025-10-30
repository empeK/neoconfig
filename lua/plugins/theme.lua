return {
	-- {
	-- 	"navarasu/onedark.nvim",
	-- 	commit = "de495fabe171d48aed5525f002d14414efcecbb2",
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- 	config = function()
	-- 		require("onedark").setup({
	-- 			style = "darker",
	-- 			transparent = true,
	-- 		})
	-- 		-- Enable theme
	-- 		require("onedark").load()
	-- 	end,
	-- },
	{
		"Shatur/neovim-ayu",
		commit = "38caa8b5b969010b1dcae8ab1a569d7669a643d5",
		config = function()
			require("ayu").colorscheme("ayu-dark")
			vim.api.nvim_set_hl(0, "LineNr", { fg = "white" })
		end,
	},
}
