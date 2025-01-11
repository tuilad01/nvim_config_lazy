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

    },
    config = function()
        local cmp = require('cmp')
        cmp.setup {
            sources = {
                { name = "nvim_lsp" }
            }
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
