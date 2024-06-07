local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- OPTS FOR LAZYVIM SETUP ARGUMENT:
local opts = {
	change_detection = {
		notify = false,
	},
	defaults = {
		-- Lazy-load by default
		lazy = true,
		-- Use the latest version of the plugin (screw semantic versioning)
		version = false,
	},
	install = {
		-- Install missing plugins.
		missing = true,
		colorscheme = {
			-- These are a list of plugins to load when installing a plugin
			-- It's listed on order. catppuccin -> habamax
			'tokyonight',
		},
	},
	performance = {
		rtp = {
			disabled_plugins = {
				-- I can disable more plugins such as `rplugin` and `netrw`, it'll decrease functionality.
				"gzip",
				"tarPlugin",
				"tohtml",
				"zipPlugin",
				"matchit",
				-- "matchparen",
				-- "netrwPlugin",
				"rplugin",
				"nvim",
				"tutor",
				"spellfile",
			},
		},
	},
}
-- Loading my plugins
-- { import = "lazyvim.plugins.extras.coding.copilot" },
-- Import plugins from `lua/plugins`

-- SETTINGS:
local opt = vim.opt
local o = vim.o
local g = vim.g

-------------------------------------- globals -----------------------------------------

-------------------------------------- options ------------------------------------------
o.laststatus = 2
o.showmode = false

o.clipboard = "unnamedplus"
o.cursorline = true
o.cursorlineopt = "number"

-- Indenting
o.expandtab = true
o.shiftwidth = 4
o.smartindent = true
o.tabstop = 4
o.softtabstop = 4

-- Disable folding
vim.opt.foldenable = false
vim.opt.foldlevel = 0

opt.guicursor = ""
opt.fillchars = { eob = " " }
opt.hlsearch = false
opt.incsearch = true
vim.opt.swapfile = false
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

-- Numbers
o.number = true
o.relativenumber = true
o.numberwidth = 2
o.ruler = false

-- disable nvim intro
opt.shortmess:append "sI"

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"
g.mapleader = " "
g.netrw_winsize = 15

-- disable some default providers
g["loaded_node_provider"] = 0
g["loaded_python3_provider"] = 0
g["loaded_perl_provider"] = 0
g["loaded_ruby_provider"] = 0
-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has("win32") ~= 0
vim.env.PATH = vim.fn.stdpath "data" .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH

-- REMAPS:
vim.keymap.set('n', '<leader>pv', function()
    if vim.bo.filetype == 'netrw' then
        vim.cmd 'Rexplore'
    else
        vim.cmd 'Explore'
    end
end, { silent = true })
vim.keymap.set('n', '<leader>pV', function()
    if vim.bo.filetype == 'netrw' then
        vim.cmd 'Rexplore'
    else
        vim.cmd 'Vexplore'
    end
end, { silent = true })
vim.keymap.set({"n"}, "<leader>L", "<cmd>Lazy<CR>", { silent = true })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("t", "<A-w>", [[<C-\><C-n><C-w>w]])
vim.keymap.set({"n", "v"}, "<A-w>", [[<C-w>]])
vim.keymap.set({"n","v"}, "<leader>q", "<cmd>:q<CR>")
vim.keymap.set({"n","v"}, "<leader>fq", "<cmd>:qall!<CR>")
vim.keymap.set("t", "<A-q>", "<cmd>:q<CR>")
vim.keymap.set({"n", "v"}, "j", [[gj]])
vim.keymap.set({"n", "v"}, "k", [[gk]])
vim.keymap.set({"n", "v"}, "<A-q>", "<cmd>:BufferClose<CR>")
vim.keymap.set("n", "<A-d>", [[<C-d>]])
vim.keymap.set("n", "<A-r>", [[<C-^>]])
vim.keymap.set("n", "<leader>hk", "<cmd>split<CR>")
vim.keymap.set("n", "<leader>vk", "<cmd>vsplit<CR>")
vim.keymap.set("n", "<leader>wa", "<cmd>wqall<CR>")
vim.cmd([[nnoremap <silent><leader>= :vert resize<CR>:resize<CR>:normal! ze<CR>]])

-- AUTOCMDS:
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 80 })
    end,
})

-- REQUIRING
require("lazy").setup({
	{ import = "rapidvim.plugins" },
}, opts)
