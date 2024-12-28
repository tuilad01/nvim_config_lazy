return {
    "sindrets/diffview.nvim",
    config = function ()
        vim.keymap.set('n', '<leader>cc', ':DiffviewOpen<Cr>')
        vim.keymap.set('n', '<leader>cl', ':DiffviewClose<Cr>')
        vim.keymap.set('n', '<leader>cg', ':DiffviewFileHistory<Cr>')
    end
}
