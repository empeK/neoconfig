return {
	"nvimtools/none-ls.nvim",
	commit = "91a59a95771da1cffb35f082c317e381a5fe85a5",
	dependencies = {
		{ "nvimtools/none-ls-extras.nvim", commit = "402c6b5c29f0ab57fac924b863709f37f55dc298" },
		{ "jayp0521/mason-null-ls.nvim", commit = "de19726de7260c68d94691afb057fa73d3cc53e7" },
	},
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics

		-- Formatters & linters for mason to install
		require("mason-null-ls").setup({
			ensure_installed = {
				"prettier",
				"eslint_d",
				"stylua",
			},
			automatic_installation = true,
		})

		local sources = {
			formatting.prettier.with({ filetypes = { "html", "json", "yaml", "markdown" } }),
			formatting.stylua,
		}

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({
			-- debug = true, -- Enable debug mode. Inspect logs with :NullLsLog.
			sources = sources,
			-- you can reuse a shared lspconfig on_attach callback here
			on_attach = function(client, bufnr)
				if client:supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end,
		})
	end,
}
