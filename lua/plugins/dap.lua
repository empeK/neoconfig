return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"mfussenegger/nvim-dap",
		"mxsdev/nvim-dap-vscode-js",
		"ramboe/ramboe-dotnet-utils",
		"theHamsta/nvim-dap-virtual-text",
		"igorlfs/nvim-dap-view",
	},
	config = function()
		local virtualText = require("nvim-dap-virtual-text")
		local dap = require("dap")
		local netcoredbg_adapter = {
			type = "executable",
			command = vim.fn.stdpath("data") .. "\\mason\\packages\\netcoredbg\\netcoredbg\\netcoredbg.exe",
			args = { "--interpreter=vscode" },
		}

		virtualText.setup({
			only_first_definition = true,
			all_frames = false,
			virt_text_pos = "eol",
		})

		dap.adapters["pwa-chrome"] = {
			type = "server",
			host = "localhost",
			port = "${port}",
			executable = {
				command = vim.fn.stdpath("data") .. "\\mason\\packages\\js-debug-adapter\\js-debug-adapter.cmd",
				args = { "${port}" },
			},
		}

		-- Angular/TS configs
		for _, lang in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
			dap.configurations[lang] = {
				{
					type = "pwa-chrome",
					request = "launch",
					name = "Angular: Launch Chrome (ng serve)",
					url = "http://localhost:4200",
					webRoot = "${workspaceFolder}",
					sourceMaps = true,
					-- If chrome isn't found automatically, set one:
					-- runtimeExecutable = "google-chrome", -- or "chromium", "brave", etc.
				},
			}
		end

		dap.adapters.netcoredbg = netcoredbg_adapter -- needed for normal debugging
		dap.adapters.coreclr = netcoredbg_adapter -- needed for unit test debugging

		dap.configurations.cs = {
			{
				type = "coreclr",
				name = "Launch .Net app",
				request = "launch",
				program = function()
					-- Run dotnet build
					local build_output = vim.fn.system({ "dotnet", "build" })
					if vim.v.shell_error ~= 0 then
						vim.notify("Build failed:\n" .. build_output, vim.log.levels.ERROR)
						return ""
					end

					return require("dap-dll-autopicker").build_dll_path()
				end,
				console = "internalConsole",
				env = {
					ASPNETCORE_ENVIRONMENT = "Development",
					DOTNET_ENVIRONMENT = "Development",
				},
			},
		}

		-- https://emojipedia.org/en/stickers/search?q=circle
		vim.fn.sign_define("DapBreakpoint", {
			text = "⚪",
			texthl = "DapBreakpointSymbol",
			linehl = "DapBreakpoint",
			numhl = "DapBreakpoint",
		})

		vim.fn.sign_define("DapStopped", {
			text = "🔴",
			texthl = "yellow",
			linehl = "DapBreakpoint",
			numhl = "DapBreakpoint",
		})
		vim.fn.sign_define("DapBreakpointRejected", {
			text = "⭕",
			texthl = "DapStoppedSymbol",
			linehl = "DapBreakpoint",
			numhl = "DapBreakpoint",
		})

		vim.keymap.set("n", "<F5>", dap.continue, {})
		vim.keymap.set("n", "<F6>", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<F7>", dap.step_out, {})
		vim.keymap.set("n", "<F8>", dap.step_over, {})
		vim.keymap.set("n", "<F9>", dap.step_into, {})
		vim.keymap.set("n", "<leader>dt", "<cmd>DapViewToggle<cr>", {})
		vim.keymap.set("n", "<leader>dw", "<cmd>DapViewWatch<cr>", {})
	end,
}
