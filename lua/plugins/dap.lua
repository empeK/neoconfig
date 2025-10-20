return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"ramboe/ramboe-dotnet-utils",
		"rcarriga/nvim-dap-ui",
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dapui = require("dapui")
		local dap = require("dap")
		local netcoredbg_adapter = {
			type = "executable",
			command = vim.fn.stdpath("data") .. "\\mason\\packages\\netcoredbg\\netcoredbg\\netcoredbg.exe",
			args = { "--interpreter=vscode" },
		}

		dapui.setup()

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
			},
		}

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

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

		-- Minimal ui
		dapui.setup({
			expand_lines = true,
			controls = { enabled = false }, -- no extra play/step buttons
			floating = { border = "rounded" },

			-- Set dapui window
			render = {
				max_type_length = 60,
				max_value_lines = 200,
			},

			-- Only one layout: just the "scopes" (variables) list at the bottom
			layouts = {
				{
					elements = {
						{ id = "scopes", size = 1.0 }, -- 100% of this panel is scopes
					},
					size = 15, -- height in lines (adjust to taste)
					position = "bottom", -- "left", "right", "top", "bottom"
				},
			},
		})

		vim.keymap.set("n", "<F4>", dapui.toggle, {})
		vim.keymap.set("n", "<F5>", dap.continue, {})
		vim.keymap.set("n", "<F6>", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<F7>", dap.step_out, {})
		vim.keymap.set("n", "<F8>", dap.step_over, {})
		vim.keymap.set("n", "<F9>", dap.step_into, {})
	end,
}
