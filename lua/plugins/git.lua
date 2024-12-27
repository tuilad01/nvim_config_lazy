return {
    "sindrets/diffview.nvim",
    config = function ()
        vim.api.nvim_set_keymap('n', '<leader>cc', ':DiffviewOpen<Cr>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<leader>cl', ':DiffviewClose<Cr>', { noremap = true, silent = true })


    end
}
