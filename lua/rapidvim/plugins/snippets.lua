return {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    lazy = true,
    event = 'InsertEnter',
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",

    dependencies = { "rafamadriz/friendly-snippets" },

    config = function()
        local ls = require("luasnip")
        local s = ls.snippet
        local t = ls.text_node
        local i = ls.insert_node

        -- Lazy loading snippets
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_snipmate").lazy_load()

        ls.filetype_extend("javascript", { "jsdoc" })

        ls.add_snippets("lua", {
            s('key', {
                t('vim.keymap.set')
            })
        })

        -- Luasnip config
        ls.config.set_config({
            history = false,
            updateevents = "TextChanged,TextChangedI",
        })
    end,
}
