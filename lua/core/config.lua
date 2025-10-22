vim.diagnostic.config({ virtual_text = true })

-- Yank highlighting
vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#fff500", fg = "#1e1c0c" })
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ higroup = "YankHighlight", timeout = 200 })
	end,
})
