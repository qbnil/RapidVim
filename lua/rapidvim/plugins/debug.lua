return {
	"rcarriga/nvim-dap-ui",
	event = "VeryLazy",
	dependencies = {
		{
			"mfussenegger/nvim-dap",
			event = "VeryLazy",
		},
		{
			"nvim-neotest/nvim-nio",
			event = "VeryLazy",
		},
	},
    config = function()
		local dap, dapui = require("dap"), require("dapui")
		require("dapui").setup({
			wrap = true,
			expand_lines = false,
		})

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open({})
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close({})
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close({})
		end

		dap.adapters["pwa-node"] = {
			type = "server",
			host = "localhost",
			port = "${port}",
			executable = {
				command = "node",
				-- 💀 Make sure to update this path to point to your installation
				args = {
					os.getenv("HOME")
						.. "/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
					"${port},",
				},
			},
		}
		dap.adapters.python = {
			type = "executable",
			command = os.getenv("HOME") .. "/.local/share/nvim/mason/packages/debugpy/venv/bin/python",
			args = { "-m", "debugpy.adapter" },
		}
		dap.configurations.javascript = {
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				cwd = "${workspaceFolder}",
			},
		}
		dap.adapters.firefox = {
			type = "executable",
			command = "node",
			args = {
				os.getenv("HOME") .. "/.local/share/nvim/mason/packages/firefox-debug-adapter/dist/adapter.bundle.js",
			},
		}
		dap.configurations.typescript = {
			{
				name = "Debug with Firefox",
				type = "firefox",
				request = "launch",
				reAttach = true,
				url = "http://localhost:3000",
				webRoot = "${workspaceFolder}",
				firefoxExecutable = "/usr/bin/firefox",
			},
		}
		dap.adapters.php = {
			type = "executable",
			command = "node",
			args = {
				os.getenv("HOME") .. "/.local/share/nvim/mason/packages/php-debug-adapter/extension/out/phpDebug.js",
			},
		}
		dap.configurations.python = {
			{
				type = "python",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				pythonPath = function()
					return "/usr/bin/python"
				end,
			},
		}
		dap.configurations.php = {
			{
				type = "php",
				request = "launch",
				name = "Listen for Xdebug",
				port = 9003,
				--  localSourceRoot = "",
				--  vim.fn.expand("%:p:h").."/",
				--  serverSourceRoot = "",
				--  localSourceRoot = vim.fn.expand("%:p:h").."/",
				--  "pathMappings": {
				--  "/mnt/d/path/to/project/app": "${workspaceRoot}/app"
				--  }
				--  serverSourceRoot = vim.fn.expand("%:p:h").."/",
				--  localSourceRoot = '/home/archi/projects-and-side-quests/php/',
				--  serverSourceRoot = '/srv/http/',
				--  log = true,
				--  pathMappings = {
				--  ['/home/archi/projects-and-side-quests/php/'] = vim.fn.getcwd() .. '/',
				--  },
				--  hostname = '0.0.0.0',
			},
		}
		-- Set keymaps to control the debugger
		vim.keymap.set("n", "<leader>dc", require("dap").continue)
		vim.keymap.set("n", "<leader>do", require("dap").step_over)
		vim.keymap.set("n", "<leader>dh", require("dap").step_into)
		vim.keymap.set("n", "<leader>dw", require("dap").step_out)
		--  vim.keymap.set('n', '<leader>db', require 'dap'.step_back)
		vim.keymap.set("n", "<leader>b", require("dap").toggle_breakpoint)
		--  vim.keymap.set('n', '<leader>B', function()
		--  require 'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))
		--  end)
		vim.keymap.set("n", "<leader>di", require("dapui").toggle)
		vim.keymap.set("n", "<leader>de", require("dapui").eval)
	end,
}
