return {
	"jiaoshijie/undotree",
	commit = "1c3e7531fad0a9c27942c5438be5adbd26260470",
	opts = {
		-- your options
	},
	keys = { -- load the plugin only when using it's keybinding:
		{ "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
	},
}
