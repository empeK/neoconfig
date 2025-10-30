return {
	"stevearc/conform.nvim",
	commit = "fbcb4fa7f34bfea9be702ffff481a8e336ebf6ed",
	opts = {},
	config = function()
		local conform = require("conform")
		local opts = {
			-- For available formatter see here: https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
			formatters_by_ft = {
				lua = { "stylua" },
				css = { "prettier" },
				scss = { "prettier" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				cs = { "csharpier" },
			},
			formatters = {
				csharpier = {
					command = "csharpier",
				},
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		}

		conform.setup(opts)
	end,
}
