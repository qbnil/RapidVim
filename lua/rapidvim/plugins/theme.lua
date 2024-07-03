return {
    'asilvam133/rose-pine.nvim',
    name = 'rose-pine',
    lazy = false,
    opts = {
        styles = {
            bold = true,
            italic = false,
            -- transparency = true,
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
            StatusLine = { fg = '#ffffff', bg = '#2c2a2c' },
            StatusLineNC = { link = "StatusLine" },
            NormalFloat = { bg = '#272627' },
            FloatBorder = { bg = '#272627' },
            FzfLuaTitle = { bg = '#272627' },
            FzfLuaPreviewTitle = { bg = '#262626' },
            FzfLuaPreviewNormal = { bg = '#262626' },
        },
    },
    config = function(_, opts)
        require('rose-pine').setup(opts)
        vim.cmd('colorscheme rose-pine-main')
        vim.api.nvim_set_hl(0, 'Pmenu', { bg = '#272727' })
        vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#525252' })
    end,
}
