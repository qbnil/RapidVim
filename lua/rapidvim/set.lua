-------------------------------------- options ------------------------------------------
vim.o.laststatus = 2
vim.o.showmode = false
vim.o.cmdheight = 1

vim.o.clipboard = "unnamedplus"
vim.o.cursorline = true
vim.o.cursorlineopt = "number"

-- Indenting
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.cmd("autocmd BufEnter * setlocal noautoindent")

-- Disable folding
vim.opt.foldenable = false
vim.opt.foldlevel = 0
vim.opt.pumblend = 0

vim.opt.guicursor = ""
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.termguicolors = true
vim.opt.swapfile = false
vim.o.ignorecase = true
vim.o.smartcase = true

-- Numbers
vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 2
vim.o.ruler = false

-- disable nvim intro
vim.opt.shortmess:append("sI")

vim.o.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.timeoutlen = 400
vim.o.undofile = true
vim.opt.fileformat = 'unix'

-- interval for writing swap file to disk, also used by gitsigns
vim.o.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append("<>[]hl")
vim.g.mapleader = " "
vim.g.netrw_winsize = 15
vim.opt.fixendofline = false

-- Cmp
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.shortmess:append("c")


-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has("win32") ~= 0
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH

