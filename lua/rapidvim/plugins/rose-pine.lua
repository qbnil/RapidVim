return {
    "asilvam133/rose-pine.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require('rose-pine').setup({
            styles = {
                bold = false,
                italic = true,
                transparency = true,
            }
        })
        vim.cmd [[colorscheme rose-pine]]
        vim.api.nvim_set_hl(0, 'Pmenu', { bg = '#272727' })
        vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#525252' })
    end
}
