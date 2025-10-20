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
}
