-- Need to install fontforge and run the following command to patch glyphs from target font like JetBrainsMonoNLNerdFontMono-SemiBold
-- .\fontforge.exe --script "E:\Programs\FontPatcher\font-patcher" --complete --progressbars "C:\Users\thele\AppData\Local\Microsoft\Windows\Fonts\JetBrainsMonoNLNerdFontMono-SemiBold.ttf"
--
return {

    "luckasRanarison/tailwind-tools.nvim",
    event = "InsertEnter",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins", -- npm install -g neovim
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        --    "nvim-telescope/telescope.nvim", -- optional
        --    "neovim/nvim-lspconfig", -- optional
    },
    opts = function ()
        return {
            document_color = {
                enabled = true,
                inline_symbol = "\\udb81\\udf64",
                kind = "inline"
            }

        }
    end
    , -- your configuration
    config = function ()
        require("tailwind-tools").setup({
            -- your configuration
        })
    end
}

