return {
    'nvim-telescope/telescope.nvim',
    event = "BufAdd",
    tag = '0.1.8',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
        -- Telescope config
        local telescope = require('telescope')
        local builtin = require('telescope.builtin')
        local actions = require('telescope.actions')

        telescope.setup({
            defaults = {
                mappins = {
                    i = {
                        ["<esc>"] = actions.close,
                    }
                }
            },
        })
        vim.keymap.set('n', '<leader>ff', function ()
            builtin.find_files({
                find_command = {"rg","--files", "--glob", "!**/.git/*",  "--glob", "!**/node_modules/*"}
            })
        end, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope find git files' })
        vim.keymap.set('n', '<leader>fs', function()
            builtin.grep_string({
                search = vim.fn.input("Grep For > "),
                additional_args = { "--glob", "!**/.git/*",  "--glob", "!**/node_modules/*" }
            })
        end)
    end
}
