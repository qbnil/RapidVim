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
		lazy = false,
		-- Use the latest version of the plugin (screw semantic versioning)
		version = false,
	},
	install = {
		-- Install missing plugins.
		missing = true,
		colorscheme = {
			-- These are a list of plugins to load when installing a plugin
			-- It's listed on order. catppuccin -> habamax
			-- "rose-pine",
            "tokyonight-night"
		},
	},
	performance = {
		rtp = {
			disabled_plugins = {
				-- I can disable more plugins such as `rplugin` and `netrw`, it'll decrease functionality.
				-- "tarPlugin",
				-- "tohtml",
				-- "zipPlugin",
				-- "matchit",
				-- "rplugin",
				-- "nvim",
				-- "tutor",
				-- "spellfile",
				-- "gzip",
				-- "zip",
				-- "tar",
				-- "getscript",
				-- "getscriptPlugin",
				-- "vimball",
				-- "vimballPlugin",
				-- "2html_plugin",
				-- "logipat",
				-- "rrhelper",
				-- "spellfile_plugin",
                "gzip",
                -- "matchit",
                -- "matchparen",
                -- "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
			},
		},
	},
}
-- Loading my plugins
-- { import = "lazyvim.plugins.extras.coding.copilot" },
-- Import plugins from `lua/plugins`
-- REQUIRING
require("lazy").setup({
	{ import = "rapidvim.plugins" },
}, opts)
