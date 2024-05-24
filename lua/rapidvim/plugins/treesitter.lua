return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local treesitter = require("nvim-treesitter.configs")
        treesitter.setup({
            highlight = {
                enable = true,
                disable = { "json" },
            },
            ensure_installed = {
                "lua",
            },
        })
    end
}
