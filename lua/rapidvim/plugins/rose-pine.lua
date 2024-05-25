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
                Keyword = { fg = "#256148"},
            },
        })
        vim.cmd('colorscheme rose-pine-main')
        vim.cmd('colorscheme rose-pine-main')
        vim.api.nvim_set_hl(0, 'Pmenu', { bg = '#262626', fg = "#cfccd1" })
        vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#312f2f' })
    end
}
