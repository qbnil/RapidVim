-- REMAPS:
vim.keymap.set("n", "<leader>pv", function()
	if vim.bo.filetype == "netrw" then
		vim.cmd("Rexplore")
	else
		vim.cmd("Explore")
	end
end, { silent = true })
vim.keymap.set("n", "<leader>pV", function()
	if vim.bo.filetype == "netrw" then
		vim.cmd("Rexplore")
	else
		vim.cmd("Vexplore")
	end
end, { silent = true })
vim.keymap.set({ "n" }, "<leader>L", "<cmd>Lazy<CR>", { silent = true })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("x", "<leader>P", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("t", "<A-w>", [[<C-\><C-n><C-w>w]])
vim.keymap.set({ "n", "v" }, "<A-w>", [[<C-w>]])
vim.keymap.set({ "n", "v" }, "<leader>q", "<cmd>:q<CR>")
vim.keymap.set({ "n", "v" }, "<leader>fq", "<cmd>:qall!<CR>")
vim.keymap.set("t", "<A-q>", "<cmd>:q<CR>")
vim.keymap.set({ "n", "v" }, "j", [[gj]])
vim.keymap.set({ "n", "v" }, "k", [[gk]])
vim.keymap.set({ "n", "v" }, "<A-q>", "<cmd>:BufferClose<CR>")
vim.keymap.set("n", "<A-d>", [[<C-d>]])
vim.keymap.set("n", "<A-r>", [[<C-^>]])
vim.keymap.set("n", "<leader>js", "<cmd>split<CR>")
vim.keymap.set("n", "<leader>ls", "<cmd>vsplit<CR>")
vim.keymap.set("n", "<leader>wa", "<cmd>wqall<CR>")
vim.keymap.set("n", "<leader>oc", "<cmd>set formatoptions-=cro<CR>")
vim.cmd([[nnoremap <silent><leader>= :vert resize<CR>:resize<CR>:normal! ze<CR>]])

