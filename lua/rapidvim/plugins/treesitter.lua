return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local treesitter = require("nvim-treesitter.configs")
		treesitter.setup({
			highlight = {
				enable = true,
				disable = { "json" },
                additional_vim_regex_highlighting = false,
			},
			ensure_installed = {
				"lua",
                "bash"
			},
			indent = {
				enable = true,
			},
		})
	end,
}
