return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = "VeryLazy",
	opts = {},
	config = function()
		require("ibl").setup({
			scope = { enabled = false },
		})
	end,
}
