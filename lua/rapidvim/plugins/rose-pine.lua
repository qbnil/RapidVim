return {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
        require('rose-pine').setup({
            disable_italics = true,
            extend_background_behind_borders = true,
            vim.cmd("colorscheme rose-pine-main")
        })
    end
}
