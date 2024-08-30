return {
    {
        "cdmill/neomodern.nvim",
        lazy = true,
        priority = 1000,
        config = function()
            require("neomodern").setup({
                -- optional configuration here
                transparent = true,
            })
            require("neomodern").load()
            vim.cmd [[colorscheme darkforest]]
        end,
    },
    {
        'rose-pine/neovim',
        lazy = false,
        -- ft = { 'lua' },
        -- keys = {
        --     { "<leader>Tr", 'colorscheme rose-pine-main' },
        -- },
        name = 'rose-pine',
        opts = {
            disable_background = true,
            extend_background_behind_borders = false,
            styles = {
                bold = true,
                italic = false,
            },
            highlight_groups = {
                ['@function.builtin.lua'] = { italic = false },
                ['@lsp.type.comment'] = { italic = true },
                ['@lsp.typemod.function.defaultLibrary.lua'] = { italic = false },
                Comment = { italic = true },
                DiagnosticUnnecessary = { italic = false },
                TabLine = { bg = 'none' },
                TabLineSel = { bg = 'none' },
                TabLineFill = { bg = 'none' },
                StatusLine = { fg = '#777693', bg = '#2c2a2c' },
                StatusLineNC = { link = "StatusLine" },
                FzfLuaTitle = { bg = 'none' },
                StatusLineTerm = { bg = '#262626', fg = '#8787aa' },
                StatusLineTermNC = { bg = '#262626', fg = '#8787aa' },
                FzfLuaPreviewTitle = { bg = 'none' },
                NormalFloat = { bg = 'none' },
                NormalNC = { bg = 'none' }
            },
        },
        config = function(_, opts)
            require('rose-pine').setup(opts)
            vim.cmd('colorscheme rose-pine-main')
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = true,
        -- ft = { 'lua' },
        -- keys = {
        --     { "<leader>Tt", 'colorscheme tokyonight-night' },
        -- },
        config = function()
            require("tokyonight").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                style = "night",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
                transparent = true,     -- Enable this to disable setting the background color
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
                styles = {
                    -- Style to be applied to different syntax groups
                    -- Value is any valid attr-list value for `:help nvim_set_hl`
                    comments = { italic = false },
                    keywords = { italic = false },
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "dark", -- style for sidebars, see below
                    floats = "dark",   -- style for floating windows
                },
                on_highlights = function(highlights, colors)
                    highlights['NormalNC'] = { bg = 'none' }
                    highlights['NormalFloat'] = { bg = 'none' }
                    highlights['StatusLine'] = { fg = '#777693', bg = '#2c2a2c' }
                    highlights['StatusLineNC'] = { link = 'StatusLine' }
                end,
            })
            vim.cmd [[colorscheme tokyonight-night]]
        end
    },
}
