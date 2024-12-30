
local M = {
    {
        'VonHeikemen/lsp-zero.nvim',
        lazy = true,
        branch = "v1.x",
        dependencies = {
            -- LSP support
            'neovim/nvim-lspconfig',

            -- Autocompletetion
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'ray-x/lsp_signature.nvim', -- Show inline documentation

            -- command line completion
            'nvim-lua/completion-nvim',
            'hrsh7th/cmp-cmdline',



            -- Snippets
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
            --Html auto close tag
            'windwp/nvim-ts-autotag'
        },
        config = function ()
            local cmp = require('cmp')
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    {name = 'path'},
                    {name = "cmdline", option = { ignore_cmds = { 'Man', '!'} }}
                })
            })

            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    local opts = {buffer = event.buf}

                    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
                    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
                    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
                end,
            })

            require('lsp_signature').setup({
                bind = true,
                floating_window = true,
                hint_enable = true,
                hint_prefix = "find",
                handler_opts = {
                    border = "rounded",

                },
                always_trigger = true,
            })
        end

    },
}

return M

