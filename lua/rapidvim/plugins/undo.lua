return {
    "mbbill/undotree",
    event = 'VeryLazy',
    config = function ()
        vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
        vim.keymap.set('n', '<leader>e', vim.cmd.UndotreeFocus)
    end
}
