return {
	"stevearc/conform.nvim",
	commit = "fbcb4fa7f34bfea9be702ffff481a8e336ebf6ed",
	opts = {},
	config = function()
		local conform = require("conform")
		local opts = {
			-- For available formatter see here: https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
			formatters_by_ft = {
				cs = { "csharpier" },
			},
			formatters = {
				csharpier = {
					command = "csharpier",
				},
			},
		}

		conform.setup(opts)

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				conform.format({ bufnr = args.buf })
			end,
		})
	end,
}
