return {
	{
		"folke/lazydev.nvim",
		commit = "258d2a5ef4a3e3d6d9ba9da72c9725c53e9afcbd",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
		config = function()
			require("lazydev").setup({
				library = { "nvim-dap-ui" },
			})
		end,
	},
}
