
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
      
      -- Snippets
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
   },
}

return M



--return {
--    -- LSP zero instal
--    'williamboman/mason.nvim',
--    'williamboman/mason-lspconfig.nvim', 
--    'neovim/nvim-lspconfig',
--    'hrsh7th/nvim-cmp',
--    'hrsh7th/cmp-buffer',
--    'hrsh7th/cmp-path',
--    'hrsh7th/cmp-nvim-lsp',
--    'hrsh7th/cmp-cmdline',
--    'hrsh7th/cmp-vsnip',
--    'hrsh7th/vim-vsnip',
--    'nvim-lua/completion-nvim',
--
--    -- Snippets
--    'L3MON4D3/LuaSnip',
--    'rafamadriz/friendly-snippets',
--    -- Html auto close tag
--    'windwp/nvim-ts-autotag'
--}
