return {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
        require('rose-pine').setup({
            styles = {
                bold = true,
                italic = true,
                transparency = true,
            },
            highlight_groups = {
                Comment = { fg = "#67616e" },
                -- VertSplit = { fg = "muted", bg = "muted" },
                Keyword = { fg = "#7b9174" },
                Visual = { bg = "#434343" },
            },
        })
        vim.cmd('colorscheme rose-pine-main')
        vim.cmd('colorscheme rose-pine-main')
        vim.api.nvim_set_hl(0, 'Pmenu', { bg = '#272727' })
        vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#525252' })
    end
}
