return {
    -- Autocompletetion
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'ray-x/lsp_signature.nvim', -- Show inline documentation

        -- command line completion
        'nvim-lua/completion-nvim',
        'hrsh7th/cmp-cmdline',
        'kristijanhusak/vim-dadbod-completion',
    },
    config = function()
        local cmp = require('cmp')
        cmp.setup {
            sources = {
                {
                    name = "nvim_lsp",
                },
                {
                    name = 'vim-dadbod-completion'
                }
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-n>'] = cmp.mapping.select_next_item(),
                ['<C-p>'] = cmp.mapping.select_prev_item(),
                ['<Tab>'] = cmp.mapping.select_next_item(),
                ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
            })
        }
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                {name = 'path'},
                {name = "cmdline", option = { ignore_cmds = { 'Man', '!'} }}
            })
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

}
