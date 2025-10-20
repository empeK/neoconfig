return {
	"nvim-lualine/lualine.nvim",
	commit = "b8c23159c0161f4b89196f74ee3a6d02cdc3a955",
	config = function()
		require("lualine").setup({
			options = {
				theme = "dracula",
			},
		})
	end,
}
