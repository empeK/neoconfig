return {
	"nvim-neo-tree/neo-tree.nvim",
	commit = "20244beec28b9d79ffb75fe1b1606f4dd8d476fc",
	branch = "v3.x",
	dependencies = {
		{ "nvim-lua/plenary.nvim", commit = "b9fd5226c2f76c951fc8ed5923d85e4de065e509" },
		{ "MunifTanjim/nui.nvim", commit = "de740991c12411b663994b2860f1a4fd0937c130" },
		{ "nvim-tree/nvim-web-devicons", commit = "b8221e42cf7287c4dcde81f232f58d7b947c210d" },
	},
	lazy = false,
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,
			filesystem = {
				follow_current_file = {
					enabled = true,
				},
				filtered_items = {
					-- visible = true,
					-- hide_dotfiles = false,
					hide_gitignored = true,
				},
			},
		})
	end,
}
