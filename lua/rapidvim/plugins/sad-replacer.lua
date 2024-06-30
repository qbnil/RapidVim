return {
    "ray-x/sad.nvim",
    event = "VeryLazy",
    dependencies = { "ray-x/guihua.lua", run = "cd lua/fzy && make" },
    config = function()
        require("sad").setup {
            debug = false, -- print debug info
            diff = 'diff-so-fancy', -- you can use `less`, `diff-so-fancy`
            ls_file = 'fd', -- also git ls-files
            exact = true, -- exact match
            vsplit = false, -- split sad window the screen vertically, when set to number
            -- it is a threadhold when window is larger than the threshold sad will split vertically,
            height_ratio = 0.6, -- height ratio of sad window when split horizontally
            width_ratio = 0.6, -- height ratio of sad window when split vertically
        }
        vim.keymap.set('n', '<leader>r', vim.cmd.Sad)
    end,
}
