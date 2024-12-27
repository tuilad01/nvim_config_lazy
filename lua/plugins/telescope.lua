return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
        -- Telescope config
        local telescope = require('telescope')
        local builtin = require('telescope.builtin')

        telescope.setup({
            defaults = {
                files_ignore_patterns = {
                    "node_modules",
                    "%.git"
                }
            },
        })


        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope find git files' })
        vim.keymap.set('n', '<leader>fs', function()
            builtin.grep_string({ search = vim.fn.input("Grep For > ") });
        end)


    end
}
