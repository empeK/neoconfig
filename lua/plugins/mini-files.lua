return {
	"nvim-mini/mini.files",
	config = function()
		require("mini.files").setup()

		vim.keymap.set("n", "<leader>e", ":lua MiniFiles.open()<CR>", { desc = "Open Mini files explorer" })
	end,
}
