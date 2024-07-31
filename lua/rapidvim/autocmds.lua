-- AUTOCMDS:
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 80 })
	end,
})
-- vim.api.nvim_create_autocmd("LspAttach", {
--     callback = function(args)
--         local client = vim.lsp.get_client_by_id(args.data.client_id)
--         client.server_capabilities.semanticTokensProvider = nil
--         if client.server_capabilities.hoverProvider then
--             vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = args.buf })
--         end
--     end,
-- })
