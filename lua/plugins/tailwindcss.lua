return {

    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins", -- npm install -g neovim
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        --    "nvim-telescope/telescope.nvim", -- optional
        --    "neovim/nvim-lspconfig", -- optional
    },
    opts = {}, -- your configuration
    config = function ()
        require("tailwind-tools").setup({
            -- your configuration
        })
    end
}

