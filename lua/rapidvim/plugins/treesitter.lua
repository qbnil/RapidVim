return {
	"nvim-treesitter/nvim-treesitter",
    lazy = false,
	build = ":TSUpdate",
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
                "bash",
                "vim",
                "vimdoc"
			},
			indent = {
				enable = true,
			},
		})
	end,
}
