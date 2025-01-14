return {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
    config = function()
        local treesj = require('treesj')
        treesj.setup({})

        vim.keymap.set({ 'n', 'v' }, '<leader>ll', function()
            treesj.toggle({ split = { recursive = true } })
        end)
    end,
}
