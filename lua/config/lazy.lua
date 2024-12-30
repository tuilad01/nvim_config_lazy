-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

--vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.rnu = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
-- This option is for when I can use vim faster. It will be no longer keep listening after 80ms.
-- vim.opt.updatetime = 80


-- Remap
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set({ "n", "v" }, "<leader>pp", "\"+p")
vim.keymap.set({ "n", "v" }, "<leader>yy", "\"+y")
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- Auto close brackets
--vim.keymap.set("i", "\"", "\"\"<left>")
--vim.keymap.set("i", "'", "''<left>")
--vim.keymap.set("i", "(", "()<left>")
--vim.keymap.set("i", "(;", "();<left><left>")
--vim.keymap.set("i", "[", "[]<left>")
--vim.keymap.set("i", "[;", "[];<left><left>")
--vim.keymap.set("i", "{", "{}<left>")
--vim.keymap.set("i", "{<CR>", "{<CR>}<ESC>O")
--vim.keymap.set("i", "{;", "{<CR>};<ESC>O")

-- TERMINAL
--vim.keymap.set("t", "<C-c>", "<C-\\><C-n>")

--vim.keymap.set('n', '<leader>tt', function ()
--    vim.cmd.lua('print("hello")')
--end, {})


-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- import your plugins
        { import = "plugins" },
    },
    -- automatically check for plugin updates
    --  checker = { enabled = true },
    -- },
})
