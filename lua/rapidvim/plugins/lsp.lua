return {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_lsp = require("cmp_nvim_lsp")
        local lsp_info_ui = require("lspconfig.ui.windows")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )
        capabilities.textDocument.completion.completionItem.snippetSupport = true
        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    lspconfig[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = {
                                    version = "LuaJIT",
                                },
                                completion = { enable = true, callSnippet = "Both" },
                                diagnostics = {
                                    enable = true,
                                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                                },
                            },
                        },
                    })
                end,
                ["tsserver"] = function()
                    lspconfig.tsserver.setup({
                        capabilities = capabilities,
                    })
                end,
                ["gopls"] = function()
                    lspconfig.gopls.setup({
                        capabilities = capabilities,
                    })
                end,
                ["pyright"] = function()
                    lspconfig.pyright.setup({
                        capabilities = capabilities,
                    })
                end,
                ["intelephense"] = function()
                    lspconfig.intelephense.setup({
                        capabilities = capabilities,
                        single_file_mode = true,
                        filetypes = { "php" },
                    })
                end,
                ["clangd"] = function()
                    lspconfig.clangd.setup({
                        capabilities = capabilities,
                    })
                end,
                ["bashls"] = function()
                    lspconfig.bashls.setup({
                        capabilities = capabilities,
                    })
                end,
                -- ["arduino_language_server"] = function()
                -- 	lspconfig.arduino_language_server.setup({
                -- 		capabilities = capabilities,
                -- 	})
                -- end,
            },
        })

        vim.diagnostic.config({
            --virtual_text = {
            -- Only show virtual text for error messages
            --    severity = vim.diagnostic.severity.ERROR,
            --},
            signs = true,
            update_in_insert = false,
            --severity_sort = true,
            float = {
                border = "single",
                style = "minimal",
                source = "always",
                header = "",
                prefix = "",
            },
        })

        -- Borders for some floating windows
        local _border = "single"
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = _border,
        })
        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
            border = _border,
        })
        lsp_info_ui.default_options = {
            border = _border,
        }

        -- Cmp
        local ls = require('luasnip')

        local s = ls.snippet
        local t = ls.text_node
        local i = ls.insert_node

        -- Lazy loading snippets
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_snipmate").lazy_load()

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

        vim.opt.completeopt = { "menu", "menuone", "noselect" }
        vim.opt.shortmess:append("c")

        local cmp = require("cmp")

        cmp.setup({
            preselect = "item",
            completion = {
                completeopt = "menu,menuone,noinsert",
            },
            window = {
                documentation = {
                    border = 'single',
                }
            },
            formatting = {
                fields = { "abbr", "kind", "menu" },
                -- here is where the change happens
                format = function(entry, item)
                    local menu_icon = {
                        nvim_lsp = "[Lsp]",
                        luasnip = "[Snip]",
                        buffer = "[Buf]",
                        path = "[Path]",
                        nvim_lua = "[Lua]",
                    }
                    item.menu = menu_icon[entry.source.name]
                    return item
                end,
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "path" },
                { name = "buffer" },
                { name = "nvim_lua" },
            },
            appearance = {
                menu = {
                    direction = "auto",
                },
            },
            mapping = {
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<A-e>"] = cmp.mapping.confirm({ select = false }),
                ["<A-a>"] = cmp.mapping.abort(),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif ls.expand_or_jumpable() then
                        vim.fn.feedkeys(
                            vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
                            ""
                        )
                    else
                        fallback()
                    end
                end, { "i", "s", "n" }),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif ls.jumpable(-1) then
                        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            },

            -- Enable luasnip to handle snippet expansion for nvim-cmp
            snippet = {
                expand = function(args)
                    ls.lsp_expand(args.body)
                end,
            },
        })


        -- Mappings
        local opts = { noremap = true, silent = true }
        vim.keymap.set("n", "gd", function()
            vim.lsp.buf.definition()
        end, opts)
        vim.keymap.set("n", "<leader>vws", function()
            vim.lsp.buf.workspace_symbol()
        end, opts)
        vim.keymap.set("n", "<leader>vd", function()
            vim.diagnostic.open_float()
        end, opts)
        vim.keymap.set("n", "[d", function()
            vim.diagnostic.goto_next()
        end, opts)
        vim.keymap.set("n", "]d", function()
            vim.diagnostic.goto_prev()
        end, opts)
        vim.keymap.set("n", "<leader>vca", function()
            vim.lsp.buf.code_action()
        end, opts)
        vim.keymap.set("n", "<leader>vrr", function()
            vim.lsp.buf.references()
        end, opts)
        vim.keymap.set("n", "<leader>vrn", function()
            vim.lsp.buf.rename()
        end, opts)
        vim.keymap.set("n", "<leader>vsh", function()
            vim.lsp.buf.signature_help()
        end, opts)
        -- vim.cmd.highlight("DiagnosticUnderlineError", "gui=undercurl")
        -- vim.cmd.highlight("DiagnosticUnderlineWarn", "gui=undercurl")
        -- vim.cmd.highlight("DiagnosticUnderlineHint", "gui=undercurl")
        -- vim.cmd([[highlight DiagnosticVirtualTextError guifg=#db4b4b guibg=#2D202A]])
        -- vim.cmd([[highlight DiagnosticVirtualTextWarn guifg=#e0af68 guibg=#2E2A2D]])
        -- vim.cmd([[highlight DiagnosticVirtualTextInfo guifg=#0db9d7 guibg=#192B38]])
        -- vim.cmd([[highlight DiagnosticVirtualTextHint guifg=#1abc9c guibg=#1A2B32]])
        vim.keymap.set("n", "<leader>is", function()
            vim.diagnostic.goto_next()
        end, {})
        vim.keymap.set("n", "<leader>dp", function()
            vim.diagnostic.open_float({ scope = "line" })
        end, {})
    end,
}
