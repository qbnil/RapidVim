-- SETTINGS:
local opt = vim.opt
local o = vim.o
local g = vim.g

-------------------------------------- globals -----------------------------------------

-------------------------------------- options ------------------------------------------
o.laststatus = 2
o.showmode = false
o.cmdheight = 1

o.clipboard = "unnamedplus"
o.cursorline = true
o.cursorlineopt = "number"

-- Indenting
opt.tabstop = 4
opt.smartindent = true
opt.shiftwidth = 4
opt.expandtab = true
opt.softtabstop = 4
opt.smartindent = true
vim.cmd("autocmd BufEnter * setlocal noautoindent")

-- Disable folding
opt.foldenable = false
opt.foldlevel = 0
opt.pumblend = 0

opt.guicursor = ""
opt.hlsearch = false
opt.incsearch = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.termguicolors = true
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
opt.shortmess:append("sI")

o.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true
opt.fileformat = 'unix'

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")
g.mapleader = " "
g.netrw_winsize = 15
opt.fixendofline = false

-- disable some default providers
g["loaded_node_provider"] = 0
g["loaded_python3_provider"] = 0
g["loaded_perl_provider"] = 0
g["loaded_ruby_provider"] = 0

-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has("win32") ~= 0
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH

