return {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    config = function()
        require('rose-pine').setup({
            variant = "main", -- auto, main, moon, or dawn
            dark_variant = "main", -- main, moon, or dawn
            disable_italics = true,
            dim_inactive_windows = false,
            extend_background_behind_borders = true,
            vim.cmd("colorscheme rose-pine")
        })
    end
}
