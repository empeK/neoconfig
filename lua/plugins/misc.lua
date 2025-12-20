return {
	{
		-- Detect tabstop and shiftwidth automatically
		"tpope/vim-sleuth",
		commit = "be69bff86754b1aa5adcbb527d7fcd1635a84080",
	},
	{
		-- Powerful Git integration for Vim
		"tpope/vim-fugitive",
		commit = "61b51c09b7c9ce04e821f6cf76ea4f6f903e3cf4",
	},
	{
		-- GitHub integration for vim-fugitive
		"tpope/vim-rhubarb",
		commit = "5496d7c94581c4c9ad7430357449bb57fc59f501",
	},
	{
		-- Autoclose parentheses, brackets, quotes, etc.
		"windwp/nvim-autopairs",
		commit = "23320e75953ac82e559c610bec5a90d9c6dfa743",
		event = "InsertEnter",
		config = true,
		opts = {},
	},
	{
		-- Split/Join parameters
		"Wansmer/treesj",
		keys = { "<space>m", "<space>j", "<space>s" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesj").setup({})
		end,
	},
	{
		"nvim-mini/mini.surround",
		opts = {
			-- No need to copy this inside `setup()`. Will be used automatically.
			{
				-- Add custom surroundings to be used on top of builtin ones. For more
				-- information with examples, see `:h MiniSurround.config`.
				custom_surroundings = nil,

				-- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
				highlight_duration = 500,

				-- Module mappings. Use `''` (empty string) to disable one.
				mappings = {
					add = "sa", -- Add surrounding in Normal and Visual modes
					delete = "sd", -- Delete surrounding
					find = "sf", -- Find surrounding (to the right)
					find_left = "sF", -- Find surrounding (to the left)
					highlight = "sh", -- Highlight surrounding
					replace = "sr", -- Replace surrounding

					suffix_last = "l", -- Suffix to search with "prev" method
					suffix_next = "n", -- Suffix to search with "next" method
				},

				-- Number of lines within which surrounding is searched
				n_lines = 20,

				-- Whether to respect selection type:
				-- - Place surroundings on separate lines in linewise mode.
				-- - Place surroundings on each line in blockwise mode.
				respect_selection_type = false,

				-- How to search for surrounding (first inside current line, then inside
				-- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
				-- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
				-- see `:h MiniSurround.config`.
				search_method = "cover",

				-- Whether to disable showing non-error feedback
				-- This also affects (purely informational) helper messages shown after
				-- idle time if user input is required.
				silent = false,
			},
		},
	},
}
