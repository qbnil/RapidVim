return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_lsp = require("cmp_nvim_lsp")
        local lsp_info_ui = require('lspconfig.ui.windows')
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
			},
			handlers = {
				function(server_name) -- default handler (optional)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,
				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = { version = "Lua 5.1" },
								diagnostics = {
									globals = { "vim", "it", "describe", "before_each", "after_each" },
								},
							},
						},
					})
				end,
				["tsserver"] = function()
					lspconfig.tsserver.setup({
						capabilities = capabilities,
					})
				end,
				["gopls"] = function()
					lspconfig.gopls.setup({
						capabilities = capabilities,
					})
				end,
				["pyright"] = function()
					lspconfig.pyright.setup({
						capabilities = capabilities,
					})
				end,
				["intelephense"] = function()
					lspconfig.intelephense.setup({
						capabilities = capabilities,
						single_file_mode = true,
						filetypes = { "php" },
						root_dir = function(fname)
							return vim.loop.os_homedir()
						end,
					})
				end,
				["clangd"] = function()
					lspconfig.clangd.setup({
						capabilities = capabilities,
					})
				end,
			},
		})

		vim.diagnostic.config({
			--virtual_text = {
			-- Only show virtual text for error messages
			--    severity = vim.diagnostic.severity.ERROR,
			--},
			signs = true,
			update_in_insert = false,
			--severity_sort = true,
			float = {
				border = "single",
				style = "minimal",
				source = "always",
				header = "",
				prefix = "",
			},
		})

        -- Borders for some floating windows
		local _border = "single"
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = _border,
		})
		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
			border = _border,
		})
        lsp_info_ui.default_options = {
            border = _border,
        }

		-- Mappings
		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, opts)
		vim.keymap.set("n", "<leader>vws", function()
			vim.lsp.buf.workspace_symbol()
		end, opts)
		vim.keymap.set("n", "<leader>vd", function()
			vim.diagnostic.open_float()
		end, opts)
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.goto_next()
		end, opts)
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.goto_prev()
		end, opts)
		vim.keymap.set("n", "<leader>vca", function()
			vim.lsp.buf.code_action()
		end, opts)
		vim.keymap.set("n", "<leader>vrr", function()
			vim.lsp.buf.references()
		end, opts)
		vim.keymap.set("n", "<leader>vrn", function()
			vim.lsp.buf.rename()
		end, opts)
		vim.keymap.set("n", "<leader>vsh", function()
			vim.lsp.buf.signature_help()
		end, opts)
		-- vim.cmd.highlight("DiagnosticUnderlineError", "gui=undercurl")
		-- vim.cmd.highlight("DiagnosticUnderlineWarn", "gui=undercurl")
		-- vim.cmd.highlight("DiagnosticUnderlineHint", "gui=undercurl")
		-- vim.cmd([[highlight DiagnosticVirtualTextError guifg=#db4b4b guibg=#2D202A]])
		-- vim.cmd([[highlight DiagnosticVirtualTextWarn guifg=#e0af68 guibg=#2E2A2D]])
		-- vim.cmd([[highlight DiagnosticVirtualTextInfo guifg=#0db9d7 guibg=#192B38]])
		-- vim.cmd([[highlight DiagnosticVirtualTextHint guifg=#1abc9c guibg=#1A2B32]])
		vim.keymap.set("n", "<leader>is", function()
			vim.diagnostic.goto_next()
		end, {})
		vim.keymap.set("n", "<leader>dp", function()
			vim.diagnostic.open_float({ scope = "line" })
		end, {})
	end,
}
