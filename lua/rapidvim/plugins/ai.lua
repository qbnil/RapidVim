return {
	"Exafunction/codeium.vim",
	event = "BufEnter",
	config = function()
		vim.g.codeium_disable_bindings = 1
		vim.keymap.set("i", "<A-s>", function()
			return vim.fn["codeium#Accept"]()
		end, { expr = true, silent = true })
		vim.keymap.set("i", "<A-h>", function()
			return vim.fn["codeium#CycleCompletions"](-1)
		end, { expr = true, silent = true })
	end,
}
