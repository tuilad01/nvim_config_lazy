
local M = {
    'VonHeikemen/lsp-zero.nvim',
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

return M

