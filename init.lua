require("config.lazy")


-- Telescope config
local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup({
    defaults = {
        files_ignore_patterns = {
            "node_modules",
            ".git"
        }
    },
--    picker = {
--        find_files = {
--            find_command = {"--glob", "!**/.git/*"}
--        }
--    }
})

vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope find git files' })
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep For > ") });
end)
