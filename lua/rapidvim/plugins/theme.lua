return {
    'asilvam133/rose-pine.nvim',
    name = 'rose-pine',
    lazy = false,
    opts = {
        styles = {
            bold = true,
            italic = false,
            transparency = true,
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
        },
    },
    config = function(_, opts)
        require('rose-pine').setup(opts)
        vim.cmd('colorscheme rose-pine-main')
        vim.api.nvim_set_hl(0, 'Pmenu', { bg = '#272727' })
        vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#525252' })
    end,
}
