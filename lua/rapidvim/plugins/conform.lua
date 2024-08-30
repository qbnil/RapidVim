return {
	"stevearc/conform.nvim",
    lazy = true,
    event = 'VeryLazy',
	config = function()
        -- Setup
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				c = { "clang_format" },
				cpp = { "clang_format" },
			},
			format_on_save = false,
		})

        -- Formatters style
		conform.formatters.clang_format = {
			prepend_args = function()
				return { "--style={IndentWidth: 4}" }
			end,
		}

        -- Keymaps
		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = true,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
