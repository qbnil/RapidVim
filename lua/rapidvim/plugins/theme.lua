return {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    opts = {
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
            -- StatusLine = { fg = '#777693', bg = '#2c2a2c' },
            StatusLineNC = { link = "StatusLine" },
            FzfLuaTitle = { bg = '#272627' },
            StatusLineTerm = { bg = '#262626', fg = '#8787aa' },
            StatusLineTermNC = { bg = '#262626', fg = '#8787aa' },
        },
    },
    config = function(_, opts)
        require('rose-pine').setup(opts)
        vim.cmd('colorscheme rose-pine-main')
        -- vim.api.nvim_set_hl(0, 'Pmenu', { bg = '#272727' })
        -- vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#525252' })
    end,
}
