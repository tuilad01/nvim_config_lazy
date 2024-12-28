return {
    {
        "roobert/tailwindcss-colorizer-cmp.nvim",
        lazy = true,
        -- optionally, override the default options:
        config = function()
            require("tailwindcss-colorizer-cmp").setup({
                color_square_width = 2,
            })
        end
    },
    {
        "luckasRanarison/tailwind-tools.nvim",
        lazy = true,
        name = "tailwind-tools",
        build = ":UpdateRemotePlugins",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            --    "nvim-telescope/telescope.nvim", -- optional
            --    "neovim/nvim-lspconfig", -- optional
        },
        opts = {} -- your configuration
    }
}
